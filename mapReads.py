import os

def runCellRanger(SRRs):
    current_path = os.getcwd()                                                   #get current working directory
    id  = 'cellranger_output'                                                    #path designated for cellranger output
    fastqs_path = current_path + '/mouse_heart_SRA_data'                         #path to folder containing fastqs from SRA
    transcriptome = current_path + '/mouse_genome/refdata-gex-mm10-2020-A'       #path to mouse genome
    cellranger_cmd = 'cellranger count --id=' + id + ' --fastqs=' + fastqs_path + ' --sample=' + 'SAN,AVN,LPF,RPF' + ' --transcriptome=' + transcriptome
    os.system(cellranger_cmd)

