import os

#function to rename GEO barcodes, genes, and matrix files and prepare appropriate folders for Seurat
def moveGEO():
    current_path = os.getcwd()                                                          #change into GEO data folder directory
    folder = "/mouse_heart_GEO_data"
    os.chdir(current_path + folder)

    #prepare folders
    SAN_folder = '/SAN'
    AVN_folder = '/AVN'
    LPF_folder = '/LPF'
    RPF_folder = '/RPF'

    #create folders
    os.mkdir(SAN_folder)
    os.mkdir(AVN_folder)
    os.mkdir(LPF_folder)
    os.mkdir(RPF_folder)

    #move files into designated folders
    for filename in os.listdir(current_path + folder):
        if('SAN' in filename):
            os.rename(current_path + folder +'/GSM3885058_SANbarcodes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885058_SANgenes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885058_SANmatrix.mtx.gz', current_path + folder + SAN_folder)
        elif('AVN' in filename):
            os.rename(current_path + folder +'/GSM3885059_AVNbarcodes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885059_AVNgenes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885059_AVNmatrix.mtx.gz', current_path + folder + SAN_folder)
        elif('LPF' in filename):
            os.rename(current_path + folder +'/GSM3885060_LPFbarcodes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885060_LPFgenes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885060_LPFmatrix.mtx.gz', current_path + folder + SAN_folder)
        elif('RPF' in filename):
            os.rename(current_path + folder +'/GSM3885061_RPFbarcodes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885061_RPFgenes.tsv.gz', current_path + folder + SAN_folder)
            os.rename(current_path + folder +'/GSM3885061_RPFmatrix.mtx.gz', current_path + folder + SAN_folder)


    os.chdir(current_path)                                                                #change to current directory



# shutil.move(os.path.join(current_path + folder, 'GSM3885061_RPFbarcodes.tsv.gz'), current_path + folder + RPF_folder)
# shutil.move(os.path.join(current_path + folder, 'GSM3885061_RPFgenes.tsv.gz'), current_path + folder + RPF_folder)
# shutil.move(os.path.join(current_path + folder, 'GSM3885061_RPFmatrix.mtx.gz'), current_path + folder + RPF_folder)



