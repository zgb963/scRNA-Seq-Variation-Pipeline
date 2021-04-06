import os
from Bio import Entrez
from Bio import SeqIO

Entrez.email = "aoluajeigbe@luc.edu"

#the ID for this piece of code can change.
#this is the original genbank file
handle = Entrez.efetch(db = "nucleotide", id = " AL732615.15", rettype = "gb", retmode = "text")

record = SeqIO.read(handle, "genbank")
#preview of sequence in outfile

outfile = open('genbank_MouseReference.txt', 'w')
outfile.write(print(handle.read()))
outfile.close()

print(handle.read())

filename = "MouseReference.fasta"

#this is from BioPython I modified it slightly to allow for the fasta format to be read in
if not os.path.isfile(filename):
    net_handle = Entrez.efetch(
        db ="nucleotide", id="AL732615.15", rettype="fasta", retmode="text"
    )
    out_handle = open(filename, "w")
    out_handle.write(net_handle.read())
    out_handle.close()
    net_handle.close()

print("Parsing...")
fasta_record = SeqIO.read(filename, "fasta")
print(record)
 






