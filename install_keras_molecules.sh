#!/bin/bash
# Script to create an anaconda environment with all OpenMSI 
# packages installed

BASEDIR='/global/common/software/m2650/nersc_python_install'
CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST
echo $CONDAPATH

# Activate our conda environment
source $CONDAPATH/bin/activate

#install pymzml with conda since pip is broken 20171108 for pymzml
conda install keras
# make sure you have already cloned here
cd /global/common/software/m2650/nersc_python_install/keras-molecules
# git clone https://github.com/biorack/metatlas.git
git pull
#pip uninstall metatlas
pip install -r requirements.txt

cd $BASEDIR


chmod -R 755 $CONDAPATH


