import os

def runCellRanger(SRRs):
    id  = ''                                        #path designated for cellranger output
    fastqs_path = ''                                #path to folder containing fastqs from SRA
    genome = ''                                     #path to mouse genome
    for SRR in SRRs:
        sample = SRR
        cellranger_cmd = 'cellranger count --id=' + id + ' --fastqs=' + fastqs_path + ' --sample=' + sample + ' --genome=' + genome
        os.system(cellranger_cmd)
