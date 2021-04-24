#set up environment 
library(dplyr)
library(Seurat)
library(patchwork)

#get full directory to mouse heart GEO data 
current_path<-getwd()
SAN_path<-paste(current_path, "/mouse_heart_GEO_data/SAN_GEO", sep="")    #path to SAN GEO data 
AVN_path<-paste(current_path, "/mouse_heart_GEO_data/AVN_GEO", sep="")    #path to AVN GEO data 
full_path<-paste(current_path, "/mouse_heart_GEO_data/", sep="") 

#For the UMAP step we will need to incorporate a way to run py_install(packages = 'umap-learn')

#load mouse heart data
zoneI.data<-Read10X(SAN_path)
zoneII.data<-Read10X(AVN_path)


#initialize the Seurat object with the raw (non-normalized data)
mouseheart<-CreateSeuratObject(counts = mouseheart.data, project = "mhscRNA", min.cells = 3, min.features = 200)
mouseheart

# The [[ operator can add columns to object metadata. This is a great place to stash QC stats
mouse[["percent.mt"]] <- PercentageFeatureSet(mouseheart, pattern = "^MT-")
.
# Visualize QC metrics as a violin plot
VlnPlot(mouseheart, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.

plot1 <- FeatureScatter(mouseheart, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(mouseheart, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2

mouseheart <- subset(mouseheart, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)

#perimeters for mouseheartdata
#mouseheart <- NormalizeData(mouseheart, normalization.method = "LogNormalize", scale.factor = 10000)

mouseheart <- NormalizeData(mouseheart)

mouseheart <- FindVariableFeatures(mouseheart, selection.method = "vst", nfeatures = 2000)

#Identify highly variable features/genes

# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(mouseheart), 10)

# plot variable features with and without labels
plot1 <- VariableFeaturePlot(mouseheart)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
plot1 + plot2

#Uniform Manifold Approximation and projection to do dimensional reduction
#mouseheart <- RunUMAP(mouseheart, dims = 1:10)

#To create the individual clusters from the UMAP done
#DimPlot(mouseheart, reduction = 'umap')
