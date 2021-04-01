import os


def renameFastqs(SRRs):
    current_path = os.getcwd()                                               #change into SRA data folder directory
    folder = "/mouse_heart_SRA_data"
    os.chdir(current_path + folder)

    for i in range(0,len(SRRs)):

        #rename fastq files to cellranger compatitable format
        rename_fastq1 = 'mv ' + SRRs[i] + '.1_1.fastq ' + SRRs[i] + '.1' + '_S1_L00' + str(SRRs[i][-1]) + '_R1' + '_001.fastq'
        rename_fastq2 = 'mv ' + SRRs[i] + '.1_2.fastq ' + SRRs[i] + '.1' + '_S1_L00' + str(SRRs[i][-1]) + '_R2' + '_001.fastq'
        rename_fastq3 = 'mv ' + SRRs[i] + '.1_3.fastq ' + SRRs[i] + '.1' + '_S1_L00' + str(SRRs[i][-1]) + '_I3' + '_001.fastq'


        os.system(rename_fastq1)
        os.system(rename_fastq2)
        os.system(rename_fastq3)

    os.chdir(current_path)                                                     #change to current directory




