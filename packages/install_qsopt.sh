#!/bin/bash
# Install package for OpenMSI conda python

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

# Activate our conda environment
source $CONDAPATH/bin/activate

# Install the package
#https://stackoverflow.com/questions/37006114/anaconda-permanently-include-external-packages-like-in-pythonpath
#Add a .pth file to the directory 
#$HOME/path/to/anaconda/lib/pythonX.X/site-packages. 
#This can be named anything (it just must end with .pth). 
#A .pth file is just a newline-separated listing of the full path-names of
#directories that will be added to your path on Python startup.

# make sure you have already cloned here
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
# you can choose a solver when running a command in cobra: https://cobrapy.readthedocs.io/en/stable/solvers.html
# specify "esolver" as your solver

