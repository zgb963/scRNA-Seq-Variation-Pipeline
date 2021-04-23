import os
import shutil

#function to rename GEO barcodes, genes, and matrix files and prepare appropriate folders for Seurat
def moveGEO():
    current_path = os.getcwd()                                                          #change into GEO data folder directory
    folder = "/mouse_heart_GEO_data"
    os.chdir(current_path + folder)

    #prepare folders
    SAN_folder = '/SAN_GEO'
    AVN_folder = '/AVN_GEO'
    LPF_folder = '/LPF_GEO'
    RPF_folder = '/RPF_GEO'

    #create folders
    os.mkdir(current_path + folder + SAN_folder)
    os.mkdir(current_path + folder + AVN_folder)
    os.mkdir(current_path + folder + LPF_folder)
    os.mkdir(current_path + folder + RPF_folder)

    #move files into designated folders
    os.system('mv ' + current_path + folder + '/GSM3885058_SANbarcodes.tsv.gz ' + current_path + folder + SAN_folder)
    os.system('mv ' + current_path + folder + '/GSM3885058_SANgenes.tsv.gz ' + current_path + folder + SAN_folder)
    os.system('mv ' + current_path + folder + '/GSM3885058_SANmatrix.mtx.gz ' + current_path + folder + SAN_folder)

    os.system('mv ' + current_path + folder + '/GSM3885059_AVNbarcodes.tsv.gz ' + current_path + folder + AVN_folder)
    os.system('mv ' + current_path + folder + '/GSM3885059_AVNgenes.tsv.gz ' + current_path + folder + AVN_folder)
    os.system('mv ' + current_path + folder + '/GSM3885059_AVNmatrix.mtx.gz ' + current_path + folder + AVN_folder)

    os.system('mv ' + current_path + folder + '/GSM3885060_LPFbarcodes.tsv.gz ' + current_path + folder + LPF_folder)
    os.system('mv ' + current_path + folder + '/GSM3885060_LPFgenes.tsv.gz ' + current_path + folder + LPF_folder)
    os.system('mv ' + current_path + folder + '/GSM3885060_LPFmatrix.mtx.gz ' + current_path + folder + LPF_folder)

    os.system('mv ' + current_path + folder + '/GSM3885061_RPFbarcodes.tsv.gz ' + current_path + folder + RPF_folder)
    os.system('mv ' + current_path + folder + '/GSM3885061_RPFgenes.tsv.gz ' + current_path + folder + RPF_folder)
    os.system('mv ' + current_path + folder + '/GSM3885061_RPFmatrix.mtx.gz ' + current_path + folder + RPF_folder)



    os.chdir(current_path)                                                                #change to current directory






