# scRNA-Seq Variation in Mouse Heart Pipeline

## Project Background 

The Cardiac Conduction System (CCS) is a group of specialized muscle cells found in the heart wall and is essential in heart development and function Their distinct components include the sinoatrial node (SAN), the atrioventricular node/His bundle(AVN/His), and Purkinje fiber (PF) regions. Cells within these components were typically thought to be “homogeneous”, but recent findings have disproved this. Each component of the CCS consists of unique cardiac cell types with their own physiological properties revealing that there is significant “intracomponent cell-type heterogeneity“ within each CCS component itself. Historically the CCS has been challenging to examine due to certain obstacles, which include small cell numbers, large cell-type heterogeneity, complex anatomy, and difficulty in isolation however new technologies such as Single cell RNA sequencing (scRNA-Seq) can identify expression differences between individual cells in tissues previously thought to be homogenous.

![cool picture that for some reason did not show up](https://www.ahajournals.org/cms/asset/f9188658-d8cb-4b61-8742-894c27847acc/379ga1.jpg)

The Barefield lab is interested in the heterogeneity of cells within areas of the heart that are typically considered "homogeneous" tissues. A Python wrapper was developed to automate the execution of various Bioinformatics software tools and to utlimatley help the Barefield lab study cell-type heterogeniety within mouse heart. The scRNA-Seq-Variation-Pipeline is built to re-map, cluster, and quantify scRNA-Seq data from Goodyer et al. (https://www.ahajournals.org/doi/10.1161/CIRCRESAHA.118.314578) to identify genes with high expression variance within mouse heart cell clusters.


Software Tools Required
=========

* Linux/Unix
* Python3
    * os
* R 
* Cell Ranger
* Seraut


Main Python Script
==================

pipeline.py
----------------

To run this repo, please clone this github to your current working directory:

`https://github.com/Genevieve-Baddoo/scRNA-Seq-Variation-Pipeline.git`

Change directory:
`cd scRNA-Seq-Variation-Pipeline`

**Next, run pipeline.py file from the scRNA-Seq-Variation-Pipeline directory**
