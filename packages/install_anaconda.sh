#!/bin/bash
# Script to create an anaconda environment with all OpenMSI 
# packages installed

#Print all commands that are executed by the script
set -o verbose
# Determine the location of our conda installation
if [ -z $CONDAPATH ]; then 
    # Use the default install location
    CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST
else 
    # Use the custom install location set by the user
    echo "CONDAPATH="$CONDAPATH; 
fi

# Set the URLs where we get anaconda from
ANACONDA_SH=Anaconda2-4.4.0-Linux-x86_64.sh
ANACONDA_URL=https://repo.continuum.io/archive/$ANACONDA_SH

# Download anaconda
echo "Downloading anaconda"
wget $ANACONDA_URL
chmod 700 $ANACONDA_SH

# Install anaconda
echo "Create condai env at: " $CONDAPATH
bash $ANACONDA_SH -b -p $CONDAPATH
rm $ANACONDA_SH

#module load python/2.7-anaconda
# conda create -p $ENVFULLPATH numpy
#conda create --clone root -p /global/common/software/m2650/python-edison

#echo "Activating the env"
#source activate $ENVFULLNAME

#echo "Install required packages"
#conda install PILLOW

#conda install django=1.6.5
#
#conda install h5py
#
#conda install lxml



