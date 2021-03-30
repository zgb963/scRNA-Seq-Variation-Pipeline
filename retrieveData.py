import os
from Bio import Entrez
from Bio.Seq import Seq
from Bio import SeqIO

#function to retrieve mouse heart data from NCBI's SRA
def getSRAdata(SRRs):
    current_path = os.getcwd()                                                   #create and change to SRA data folder directory
    folder = "/mouse_heart_SRA_data"
    os.mkdir(current_path + folder)
    os.chdir(current_path + folder)

    for SRR in SRRs:
        if(SRR[-1] == '3'):
            SRR_data_address = 'https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos2/sra-pub-run-25/' + SRR + '/' + SRR + '.1'
            wget_SRR = 'wget' + ' ' + SRR_data_address
            fastq_dump_SRR = 'fastq-dump -I --split-files' + ' ' + SRR + '.1'
            os.system(wget_SRR)                                                #retrieve SRA data using wget command
            os.system(fastq_dump_SRR)                                          #uncompress data and convert to paired-end fastq files using fastq-dump command


        else:
            SRR_data_address = 'https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-run-20/' + SRR + '/' + SRR + '.1'
            wget_SRR = 'wget' + ' ' + SRR_data_address
            fastq_dump_SRR = 'fastq-dump -I --split-files' + ' ' + SRR + '.1'
            os.system(wget_SRR)                                                #retrieve SRA data using wget command
            os.system(fastq_dump_SRR)                                          #uncompress data and convert to paired-end fastq files using fastq-dump command

    os.chdir(current_path)                                                     #change to current directory

#TO DOs: Implement getRefGenome and pull out CDS
#function to retrieve mouse reference genome index
#def getRefGenome(): ...
