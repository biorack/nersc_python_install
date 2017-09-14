#!/bin/bash
# Script to create an anaconda environment with all OpenMSI 
# packages installed

#Print all commands that are executed by the script
set -o verbose
# Determine the location of our conda installation
if [ -z $CONDAPATH ]; then 
    # Use the default install location
    CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST
    #if [ -z $CONDA_ENABLEMPI ]; then
    #    CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST"-parallel"
    #sfi
else
    # Use the custom install location set by the user
    echo "CONDAPATH="$CONDAPATH;
fi



echo $CONDAPATH

bash packages/install_anaconda.sh
bash packages/install_matplotlib-venn.sh
bash packages/install_cobra.sh
bash packages/install_rdkit.sh
bash packages/install_nb_conda_kernels.sh
bash packages/install_qsopt.sh
bash packages/install_pyteomics.sh
bash packages/install_metatlas.sh
bash packages/install_molvs.sh
bash packages/install_python-libsbml.sh
bash packages/install_BASTet.sh
bash packages/install_pyimzml.sh
#bash packages/install_gspread.sh

chmod -R 755 $CONDAPATH


