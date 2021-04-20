library(dplyr)
library(Seurat)
library(patchwork)

# Load the PBMC dataset
mouseheart.data <- Read10X("C:/Users/willi/Downloads/pbmc_multimodal.h5seurat/")
# Initialize the Seurat object with the raw (non-normalized data).
mouseheart <- CreateSeuratObject(counts = mouse.data, project = "pbmc3k", min.cells = 3, min.features = 200)
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

mouseheart <- NormalizeData(mouseheart, normalization.method = "LogNormalize", scale.factor = 10000)

mouseheart <- NormalizeData(mouseheart)

mouseheart <- FindVariableFeatures(mouseheart, selection.method = "vst", nfeatures = 2000)

#Identify highly variable features/genes

# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(mouseheart), 10)

# plot variable features with and without labels
plot1 <- VariableFeaturePlot(mouseheart)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
plot1 + plot2
