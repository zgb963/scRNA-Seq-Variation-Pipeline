 # scRNA-Seq Variation in Mouse Heart Pipeline

 # Overview #

Dr. Barefield’s Lab (Barefield Lab) is interested in the heterogeneity of cells within the CCS. The Cardiac Conduction System (CCS) is a group of specialized muscle cells found in the heart’s walls. These muscle cells send signals to the rest of the heart muscle, which causes a contraction. Their distinct components include the sinoatrial node (SAN), the atrioventricular node/His bundle(AVN/His), and Purkinje fiber (PF) regions. The cells within these components were typically thought to be “homogeneous”. But each component of the CCS consists of unique cardiac cell types with their own physiological properties. Therefore, these components have significant cellular heterogeneity. The analysis of individual single cells within the CCS is important to discover the mechanisms of the heart not seen by studying a bulk population of cardiac cells.

Presently, there are a limited number of distinct molecular markers for the different CCS cell types. Knowing this creates challenges for additional investigation into their speciation, patterning, and function. Prior studies have assessed gene expression with individual components of the CCS, but they are unable to discern cell-type heterogeneity due to bulk tissue analysis. Single-cell RNA-sequencing (scRNA-seq) can discern cell-type heterogeneity because it allows for global gene expression analysis at single-cell resolution. This type of sequencing identifies expression differences between individual cells in tissues previously thought to be homogenous in the CCS. The scRNA-Seq-Variation-Pipeline built here will re-map, cluster, and quantify scRNA-seq data from Goodyer et al. This paper discusses the transcriptomic profiling of the developing CCS at single-cell resolution in wild-type mouse hearts. Creating this pipeline using bioinformatics analysis will identify genes in the CCS with high expression variance within clusters.

Although there are hurdles in understanding the intricate cellular and molecular landscape of the CCS, the combination of microdissection, single-cell isolation, and RNA sequencing can be used to overcome these hurdles. The pipeline built will help provide a foundation for a molecular blueprint of the CCS. This project represents a comprehensive assessment of gene expression profiling and provides bioinformatics tools to facilitate future efforts in CCS cell identification and characterization.

 # Context #

As aforementioned the CCS plays an essential role in heart development and function. Currently we know that there is  significant “intracomponent cell-type heterogeneity“ within each CCS component itself. 

An example of cell type heterogeneity in the CCS are transitional cells. Transitional cells are found in each CCS component. It has been hypothesized that transitional cells are responsible for amplifying current before passing it on to the surrounding myocardium which is crucial for the rhythmic beating of the heart. There are many cardiac disorders linked to disturbances in transitional cells including sinus node dysfunction, heart block and ventricular fibrillation. 

Despite the vast array of cell-type heterogeneity within CCS components, transitional cells belong to the limited library of cell-types whose function is known and has been studied. Historically the CCS has been challenging to examine due to certain obstacles, which include small cell numbers, large cell-type heterogeneity, complex anatomy, and difficulty in isolation. 

The obstacles in studying CCS cell-type heterogeneity can be overcome using  single-cell RNA-sequencing (scRNA-Seq). Single-cell RNA-Sequencing allows for genome-wide analysis of gene expression at single-cell resolution. The project objective is to assess the transcriptional landscape of the CCS at single-cell resolution by single-cell RNA-sequencing using a developing mouse heart as a model. The project is important because not only will it increase our knowledge of CCS cell-type heterogeneity by  providing a foundation for further cell specification, patterning, and function, but  will also contribute to our knowledge of cardiac diseases. 

It is evident from the example of transitional cells that understanding the complex cell-type heterogeneity of CCS components can greatly contribute to our knowledge of cardiac diseases as well as our ability to diagnose and treat those suffering from such clinical disorders. 

# Goals # 

* Obtain FASTQ files from SRA in Gene Expression Omnibus (GEO)
* De-multiplex and map scRNA-Seq data to the mouse genome using Cell Ranger 
* Perform clustering of scRNA-Seq data using Seraut
* Quantify scRNA-Seq data
* Report significant output including standard deviations of gene expression of cells in clusters of interest

# Non-Goals #

* Categorize CCS component cell-types through specification, patterning, and function
* Determine correlation between disease and specific cell-types

# Proposed Solution #



![flowchart](https://github.com/Genevieve-Baddoo/scRNA-Seq-Variation-Pipeline/blob/main/Comp%20Bio%20scRNA-Seq%20Pipeline.png)




# Milestones # 
<table>
  <tbody>
    <tr>
      <th>Week</th>
      <th>Genevieve</th>
      <th>Aditi</th>
      <th>Ade</th>
    </tr>
   <tr>
     <td>March 14 </br> (Week 9)</td>
      <td>
        <ul>
         <li>Complete design doc</li>
         <li>Retrieve SRA data + determine SRA data type </li>
         <li>Become familiar with Cell Ranger and Seraut + determine default parameters</li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Complete design doc</li>
         <li>Retrieve SRA data + determine SRA data type </li>
         <li>Become familiar with Cell Ranger and Seraut + determine default parameters</li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Complete design doc</li>
         <li>Retrieve SRA data + determine SRA data type </li>
         <li>Become familiar with Cell Ranger and Seraut + determine default parameters</li>
        </ul>
      </td>
    </tr>
   <tr>
     <td>March 21 </br> (Week 10)</td>
      <td>
        <ul>
         <li>Meet with Dr. Barefield</li>
         <li>Build python script to run Cell Ranger on SRA data </li>
         <li>Retrieve CellRanger output matrix files from GEO</li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Meet with Dr. Barefield</li>
         <li>Build python script to run Cell Ranger on SRA data </li>
         <li>Retrieve CellRanger output matrix files from GEO</li>
        </ul>      
      </td>
      <td>
        <ul>
         <li>Meet with Dr. Barefield</li>
         <li>Build R script to perform clustering of scRNA-Seq data using Seraut</li>
        </ul>
      </td>
    </tr>
    <tr>
     <td>March 28 </br> (Week 11)</td>
      <td>
        <ul>
         <li>Test/debug R script  with python script output data</li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Test/debug R script  with python script output data</li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Test/debug  Python script with SRA data</li>
        </ul>
      </td>
    </tr>
    <tr>
     <td>April 4 </br> (Week 12)</td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
    </tr>
    <tr>
     <td>April 11 </br> (Week 13)</td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Implement Dr.Barefield’s feedback to generate significant outputs </li>
        </ul>
      </td>
    </tr>
    <tr>
     <td>April 18 </br> (Week 14)</td>
      <td>
        <ul>
         <li>Test and debug pipeline </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Test and debug pipeline </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Test and debug pipeline </li>
        </ul>
      </td>
    </tr>
    <tr>
     <td>April 25 </br> (Week 15)</td>
      <td>
        <ul>
         <li>Prepare final presentation </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Prepare final presentation </li>
        </ul>
      </td>
      <td>
        <ul>
         <li>Prepare final presentation </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>



