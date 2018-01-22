#!/bin/bash
# Script to create an anaconda environment with all OpenMSI 
# packages installed

BASEDIR='/global/common/software/m2650/nersc_python_install'
CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST
echo $CONDAPATH

# Activate our conda environment
source $CONDAPATH/bin/activate

#install pymzml with conda since pip is broken 20171108 for pymzml
conda update anaconda
conda update --all

cd $BASEDIR


chmod -R 755 $CONDAPATH


