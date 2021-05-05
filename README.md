# scRNA-Seq Variation in Mouse Heart Pipeline


## Project Background 

The Cardiac Conduction System (CCS) is a group of specialized muscle cells found in the heart wall and is essential in heart development and function Their distinct components include the sinoatrial node (SAN), the atrioventricular node/His bundle(AVN/His), and Purkinje fiber (PF) regions. Cells within these components were typically thought to be “homogeneous”, but recent findings have disproved this. Each component of the CCS consists of unique cardiac cell types with their own physiological properties revealing that there is significant “intracomponent cell-type heterogeneity“ within each CCS component itself. Historically the CCS has been challenging to examine due to certain obstacles, which include small cell numbers, large cell-type heterogeneity, complex anatomy, and difficulty in isolation however new technologies such as Single cell RNA sequencing (scRNA-Seq) can identify expression differences between individual cells in tissues previously thought to be homogenous.

![cool picture](https://www.ahajournals.org/cms/asset/f9188658-d8cb-4b61-8742-894c27847acc/379ga1.jpg)

The Barefield lab is interested in the heterogeneity of cells within areas of the heart that are typically considered "homogeneous" tissues. A Python wrapper was developed to automate the execution of various Bioinformatics software tools and to utlimately help the Barefield lab study cell-type heterogeniety within mouse heart. The scRNA-Seq-Variation-Pipeline re-maps, clusters, and quantifies scRNA-Seq data from Goodyer et al. (https://www.ahajournals.org/doi/10.1161/CIRCRESAHA.118.314578) to generate t-SNE plots displaying clusters within the zones and to identify genes with high expression variance within mouse heart cell clusters.


## Software Tools Required

* Linux/Unix
* Python 3
    * os
* R
   * dplyr
   * umap-learn 
* Cell Ranger
* Seraut

## Pipeline Overview

The scRNA-Seq-Variation-Pipeline is divided into two sub-pipelines. 

Pipeline 1 or `pipeline_1.py` retrieves fastq files from NCBI’s SRA database and map reads to a pre-built mouse genome using Cell Ranger. Genrates a folder named `cellranger_output` which stores important files generated from running Cell Ranger such as `barcodes.tsv.gz` `features.tsv.gz` and `matrix.mtx.gz` files

Pipeline 2 or `pipeline_2.py` retrieves `barcodes.tsv.gz` `features.tsv.gz` and `matrix.mtx.gz` files from NCBI’s GEO database and prepares/normalizes data to generate clusters using Seurat. Genrates a folder named `seurat_output` which stores final outputs summarizing analysis including t-SNE plots and tables of differentially expressed features (cluster biomarkers) for significant clusters 

## Run The Pipeline: 

<h5> Clone Repository: </h5> 

`https://github.com/Genevieve-Baddoo/scRNA-Seq-Variation-Pipeline.git`

<h5> Move Into Project Directory: </h5>

`cd scRNA-Seq-Variation-Pipeline/`

<h5> Run Pipeline 1: </h5>

`python3 pipeline_1.py`

***Note - Pipeline 1 is currently being modified and therefore isn't needed to perform analysis or generate final outputs (please refer to [Design Doc](https://github.com/Genevieve-Baddoo/scRNA-Seq-Variation-Pipeline/blob/main/DesignDocument.md)) Pipeline 2 retrieves data similar to that generated in Cell Ranger and is able to generate final outputs. In order to run pipeline ONLY run Pipeline 2***

<h5> Run Pipeline 2: </h5>

`python3 pipeline_2.py`


## Important Scripts 

Pipeline 1 
>* `retrieveDataSRA.py`
>retrieves fastq mouse heart data from NCBI's SRA and pre-built reference mouse genome within Cell Ranger. Creates `mouse_heart_SRA_data` folder to store fastq files and `mouse_genome` folder to store genome 

>* `reformatDataSRA.py`
>renames fastq files to original format that is Cell Ranger compatible 

>* `mapReads.py`
 >calls Cell Ranger command to map sequencing reads to the mouse reference genome. Creates `cellranger_output` folder which stores barcodes, features, and matrix files 

Pipeline 2
>* `retrieveDataGEO.py`
>retrieves mouse heart data or barcodes, features, and matrix files (synonymous with Cell Ranger output) from NCBI's GEO database. Creates `mouse_heart_GEO_data` folder to store files 
 
>* `reformatDataGEO.py`
>renames GEO barcodes, genes, and matrix files and prepares appropriate folders (e.g `SAN_GEO`) for Seurat to read in
 
>* `Clustering.R`
>creates a Seurat object for each zone, performs QC parameters and filtration on data, scales and normalizes data, performs PCA and dimensional reduction, and finally clusters data. Significant outputs are stored in `seruat_output` folder 


## Important Outputs
`seurat_output` folder stores final results or analysis of the pipeline including the t-SNE plots for Zone I, Zone II, and Zone III and tables of differentially expressed features (cluster biomarkers) for significant clusters in each Zone 

