#!/bin/bash
# Script to set permissions for python packages and binaries

#Print all commands that are executed by the script
#set -o verbose
# Determine the location of our conda installation
CONDAPATH_SERIAL="/usr/common/contrib/m1541/openmsi-"$NERSC_HOST
CONDAPATH_PARALLEL="/usr/common/contrib/m1541/openmsi-"$NERSC_HOST"-parallel"


#change permissions for users
# make installation routines world readable and OpenMSI editable
chmod -R 774 /usr/common/contrib/m1541/nersc_python_install
chgrp -R OpenMSI /usr/common/contrib/m1541/nersc_python_install



#make python binaries and packages world runable and readable
chmod -R 775 $CONDAPATH_SERIAL
chmod -R 775 $CONDAPATH_PARALLEL

#setfacl -m g:m1541:rx -R $CONDAPATH

