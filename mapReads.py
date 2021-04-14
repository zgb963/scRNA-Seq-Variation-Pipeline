import os

def runCellRanger(SRRs):
<<<<<<< HEAD
    current_path = os.getcwd()                                           #get current working directory
    id  = 'cellranger_output'                                            #path designated for cellranger output
    fastqs_path = current_path + '/mouse_heart_SRA_data'                 #path to folder containing fastqs from SRA
    transcriptome = current_path + '/mouse_genome/refdata-gex-mm10-2020-A'      #path to mouse genome
    samples = ' '.join([str(SRR) for SRR in SRRs])
    samples = samples.replace(' ', ',')
    cellranger_cmd = 'cellranger count --id=' + id + ' --fastqs=' + fastqs_path + ' --sample=' + samples + ' --transcriptome=' + transcriptome 
=======
    current_path = os.getcwd()                                                   #get current working directory
    id  = 'cellranger_output'                                                    #path designated for cellranger output
    fastqs_path = current_path + '/mouse_heart_SRA_data'                         #path to folder containing fastqs from SRA
    transcriptome = current_path + '/mouse_genome/refdata-gex-mm10-2020-A'       #path to mouse genome
    cellranger_cmd = 'cellranger count --id=' + id + ' --fastqs=' + fastqs_path + ' --sample=' + 'SAN,AVN,LPF,RPF' + ' --transcriptome=' + transcriptome
>>>>>>> 432c9c98467738aaa2ec355f7722a06bed232244
    os.system(cellranger_cmd)

