import os

#GSM3885058: Zone I: SAN region; Mus musculus


#retrieve mouse heart data from NCBI's SRA
def getSRAdata(SRRs):
    current_path = os.getcwd()                                                   #create and change to mouse heart data folder directory
    folder = "/mouseheartdata"
    os.mkdir(current_path + folder)
    os.chdir(current_path + folder)
    for SRR in SRRs:
        SRR_data_address = 'https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-run-20/'+ SRR + '/'+ SRR + '.1'
        wget_SRR = 'wget' + ' ' + SRR_data_address
        fastq_dump_SRR = 'fastq-dump -I --split-files' + ' ' + SRR + '.1'
        os.system(wget_SRR)                                                      #retrieve mouse heart data using wget command
        os.system(fastq_dump_SRR)                                                #uncompress data and convert to paired-end fastq files using fastq-dump command

    os.chdir(current_path)                                                       #change to current directory
