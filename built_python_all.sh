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

source packages/install_anaconda.shs
source packages/install_metatlas.sh
# make sure to cd after these

source packages/install_rdkit.sh
source packages/install_molvs.sh

source packages/install_matplotlib-venn.sh

source packages/install_pyteomics.sh
source packages/install_pyimzml.sh
source packages/install_BASTet.sh
#make sure to cd after these

#source packages/install_cobra.sh
#source packages/install_python-libsbml.sh
#source packages/install_qsopt.sh

#bash packages/install_nb_conda_kernels.sh
#bash packages/install_setuptools.sh
#bash packages/install_gspread.sh

chmod -R 755 $CONDAPATH


