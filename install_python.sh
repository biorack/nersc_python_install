#!/bin/bash
# Script to create an anaconda environment with all OpenMSI 
# packages installed

BASEDIR='/global/common/software/m2650/nersc_python_install'
CONDAPATH="/global/common/software/m2650/python-"$NERSC_HOST
echo $CONDAPATH

cd $BASEDIR
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

# Activate our conda environment
source $CONDAPATH/bin/activate

#install pymzml with conda since pip is broken 20171108 for pymzml
conda config --add channels bioconda
conda install -y pymzml
### Install Metabolite Atlas ###
# make sure you have already cloned here
cd /global/common/software/m2650/nersc_python_install/metatlas
# git clone https://github.com/biorack/metatlas.git
git pull
#pip uninstall metatlas
pip install .
cp /global/common/software/m2650/nersc_python_install/metatlas/metatlas/helpers/isotope_dict.pkl /global/common/software/m2650/python-cori/lib/python2.7/site-packages/metatlas/helpers/
cd $BASEDIR

pip install --disable-pip-version-check ijson

conda install -y -c anaconda pymysql

conda install -y -c https://conda.anaconda.org/rdkit rdkit
pip install --disable-pip-version-check molvs
conda install -y -c conda-forge matplotlib-venn 

pip install --disable-pip-version-check pyteomics
pip install --disable-pip-version-check pyimzml


SITE_PACKAGES_FILE=${CONDAPATH%%/}/lib/python2.7/site-packages/BASTet.pth
# make sure to clone it here
cd /global/common/software/m2650/nersc_python_install/BASTet
# git clone https://github.com/biorack/BASTet.git
git pull
package_path=$(pwd)
echo $package_path >> $SITE_PACKAGES_FILE
cd $BASEDIR


conda install -y cobra
conda install -y python-libsbml
# Install QSOPT solver
# make sure to clone it here
cd /global/common/software/m2650/nersc_python_install/qsopt-ex
# git clone https://github.com/jonls/qsopt-ex.git
git pull
./bootstrap 
mkdir build
cd build/
../configure --prefix=$CONDAPATH
make -j4
make install
echo 'add this to the path:'
echo 'import os'
echo "os.environ['PATH'] = os.environ['PATH']+:"$CONDAPATH"/bin"

### OTHER PACKAGES ###
#bash packages/install_nb_conda_kernels.sh
#bash packages/install_setuptools.sh
#bash packages/install_gspread.sh

### REINSTALL NUMPY ###
#RDKIT gets broken by some numpy dependency above, but I do not know which package is breaking it
pip install -U numpy
#numpy-1.13.3 seems to work, numpy-1.12.1 does not

chmod -R 755 $CONDAPATH


