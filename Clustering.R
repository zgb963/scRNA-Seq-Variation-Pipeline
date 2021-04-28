#setwd("/homes/gbaddoo") set correct working directory before running lines below
#set up environment and load packages
library(dplyr)
library(Seurat)
library(patchwork)

#run this line once before running code below (for umap plots)
#reticulate::py_install(packages ='umap-learn')


### SETUP THE SEURAT OBJECT ###

#get full directory to mouse heart GEO data 
current_path<-getwd()

#run in Rstudio: 
SAN_path<-paste(current_path, "/scRNA-Seq-Variation-Pipeline/mouse_heart_GEO_data/SAN_GEO", sep="")    #path to SAN GEO data 
AVN_path<-paste(current_path, "/scRNA-Seq-Variation-Pipeline/mouse_heart_GEO_data/AVN_GEO", sep="")    #path to AVN GEO data 


#run in terminal: 
#SAN_path<-paste(current_path, "/mouse_heart_GEO_data/SAN_GEO", sep="")    #path to SAN GEO data 
#AVN_path<-paste(current_path, "/mouse_heart_GEO_data/AVN_GEO", sep="")    #path to AVN GEO data 

#For the UMAP step we will need to incorporate a way to run py_install(packages = 'umap-learn')

#load data

zoneI.data<-Read10X(SAN_path)
zoneII.data<-Read10X(AVN_path)


#initialize the Seurat objects with the raw (non-normalized data)
zoneI<-CreateSeuratObject(counts = zoneI.data, project = "zone I", min.cells = 3, min.features = 200)
zoneII<-CreateSeuratObject(counts = zoneII.data, project = "zone II", min.cells = 3, min.features = 200)



### STANDARD PRE-PROCESSING WORKFLOW ###

#QC and selecting cells for further analysis
zoneI[["percent.mt"]] <- PercentageFeatureSet(zoneI, pattern = "^MT-")
zoneII[["percent.mt"]] <- PercentageFeatureSet(zoneII, pattern = "^MT-")

#visualize QC metrics as a violin plot
VlnPlot(zoneI, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
VlnPlot(zoneII, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

#use featureScatter to visualize feature-feature relationships, also can be used for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1 <- FeatureScatter(zoneI, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(zoneI, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2

plot1 <- FeatureScatter(zoneII, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(zoneII, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2

zoneI <- subset(zoneI, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
zoneII <- subset(zoneI, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)



### NORMALIZING THE DATA ###

#normalize the data by employing a global-scaling normalization method “LogNormalize”
zoneI <- NormalizeData(zoneI, normalization.method = "LogNormalize", scale.factor = 10000)
zoneII <- NormalizeData(zoneII, normalization.method = "LogNormalize", scale.factor = 10000)



### IDENTIFICATION OF HIGHLY VARIABLE FEATURES (FEATURE SELECTION) ###

#calculate a subset of features that exhibit high cell-to-cell variation in the dataset by directly modeling the mean-variance relationship inherent in single-cell data 
zoneI <- FindVariableFeatures(zoneI, selection.method = "vst", nfeatures = 2000)
zoneII <- FindVariableFeatures(zoneII, selection.method = "vst", nfeatures = 2000)

#identify the 10 most highly variable genes
top10zoneI <- head(VariableFeatures(zoneI), 10)
top10zoneI
top10zoneII <- head(VariableFeatures(zoneII), 10)
top10zoneII

#plot variable features with and without labels 
plot1 <- VariableFeaturePlot(zoneI)
plot2 <- LabelPoints(plot = plot1, points = top10zoneI, repel = FALSE)
plot1 + plot2

plot1 <- VariableFeaturePlot(zoneII)
plot2 <- LabelPoints(plot = plot1, points = top10zoneII, repel = FALSE)
plot1 + plot2



### SCALING THE DATA ###

#apply a linear transformation (‘scaling’) that is a standard pre-processing step prior to dimensional reduction techniques like PCA
#Shifts the expression of each gene, so that the mean expression across cells is 0, Scales the expression of each gene, so that the variance across cells is 1
all.genes <- rownames(zoneI)
zoneI <- ScaleData(zoneI, features = all.genes)

all.genes <- rownames(zoneII)
zoneII <- ScaleData(zoneII, features = all.genes)

###  PERFORM LINEAR DIMENSIONAL REDUCTION ###

#perform PCA on the scaled data
zoneI <- RunPCA(zoneI, features = VariableFeatures(object = zoneI))
zoneII <- RunPCA(zoneII, features = VariableFeatures(object = zoneII))

print(zoneI[["pca"]], dims = 1:5, nfeatures = 5)

### DETERMINE THE 'DIMENSIONALITY' OF THE DATASET ###

# NOTE: This process can take a long time for big datasets, comment out for expediency. More
# approximate techniques such as those implemented in ElbowPlot() can be used to reduce
# computation time
zoneI <- JackStraw(zoneI, num.replicate = 100)
zoneI <- ScoreJackStraw(zoneI, dims = 1:20)

JackStrawPlot(zoneI, dims = 1:15)

zoneII <- JackStraw(zoneII, num.replicate = 100)
zoneII <- ScoreJackStraw(zoneII, dims = 1:20)

JackStrawPlot(zoneII, dims = 1:15)

#heuristic alternative to JackStraw  
ElbowPlot(zoneI)
ElbowPlot(zoneII)



### CLUSTER THE CELLS ###
zoneI <- FindNeighbors(zoneI, dims = 1:10)
zoneI <- FindClusters(zoneI, resolution = 0.5)

zoneII <- FindNeighbors(zoneII, dims = 1:10)
zoneII <- FindClusters(zoneII, resolution = 0.5)

#look at cluster IDs of the first 5 cells
head(Idents(zoneI), 5)
head(Idents(zoneII), 5)


### RUN NON-LINEAR DIMENSIONAL REDUCTION (UMAP/t-SNE) ###
#reticulate::py_install(packages ='umap-learn')
#Run t-distributed Stochastic Neighbor Embedding

#NOTE: tutorial only included UMAP but this is TSNE also I changed the parameters around
#ISSUE: zoneI and zoneII have the same plots?

zoneI <- RunUMAP(zoneI, dims = 1:50)
zoneI <- RunTSNE(zoneI,dims.use = 1:10,reduction.use = "pca")
DimPlot(zoneI, reduction = "tsne")


zoneII <- RunUMAP(zoneI, dims = 1:50)
zoneII <- RunTSNE(zoneII,dims.use = 1:15, reduction.use = "pca")
DimPlot(zoneII, reduction = "tsne")


####Finding differentially expressed features (cluster biomarkers)########

#cluster numbers described in Goodyer et al paper

#find all markers of Cluster 9 in zone I
cluster9.markers <- FindMarkers(zoneI, ident.1 = 9, min.pct = 0.25)
head(cluster9.markers, n = 5)


#find all markers of Cluster 4 in zone II
cluster4.markers <- FindMarkers(zoneII, ident.1 = 9, min.pct = 0.25)
head(cluster4.markers, n = 5)


#find all markers of Cluster 13 in Zone III
#cluster13.markers <- FindMarkers(zoneIII, ident.1 = 9, min.pct = 0.25)
#head(cluster13.markers, n = 5)


#Uniform Manifold Approximation and projection to do dimensional reduction
#mouseheart <- RunUMAP(mouseheart, dims = 1:10)

#To create the individual clusters from the UMAP done
#DimPlot(mouseheart, reduction = 'umap')
