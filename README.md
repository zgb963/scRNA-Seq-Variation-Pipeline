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

Pipeline 1 or `pipeline_1.py` retrieves fastq files from NCBI’s SRA database and map reads to a pre-built mouse genome using Cell Ranger. Genrates a folder named `cellranger_output` which stores important files generated from running Cell Ranger such as `barcodes.tsv.gz` `genes.tsv.gz` and `matrix.mtx.gz` files

Pipeline 2 or `pipeline_2.py` retrieves `barcodes.tsv.gz` `genes.tsv.gz` and `matrix.mtx.gz` files from NCBI’s GEO database and prepares/normalizes data to generate clusters using Seurat. Genrates a folder named `seurat_output` which stores final outputs summarizing analysis including t-SNE plots and tables of differentially expressed features (cluster biomarkers) for significant clusters 

## Run The Pipeline: 

<h5> Clone Repository: </h5> 

`https://github.com/Genevieve-Baddoo/scRNA-Seq-Variation-Pipeline.git`

<h5> Move Into Project Directory: </h5>

`cd scRNA-Seq-Variation-Pipeline/`

<h5> Run Pipeline 1: </h5>

`python3 pipeline_1.py`

**Note - Pipeline 1 is currently being modified and therefore isn't needed to perform analysis or generate final outputs. Pipeline 2 retrieves data similar to that generated in Cell Ranger and is able to generate final outputs. In order to run pipeline ONLY run Pipeline 2** 

<h5> Run Pipeline 2: </h5>

`python3 pipeline_2.py`


Important files and outputs
==================

* retrieveData.py
>retrieves mouse heart data from NCBI's SRA and retrieves Cell Ranger reference mouse genome. Creates mouse heart SRA data output folder

* reformatData.py
>reformats fastq files for Cell Ranger input 

* mapReads.py
>contains Cell Ranger command to map sequencing reads to the mouse reference genome. Creates Cell Ranger output folder

* clusteringSeurat.R
>runs R package called Seurat that clusters mouse heart data from Cell Ranger output
