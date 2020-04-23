# notebook to record instructions
# how to start a number of VMs for students based on a common Docker image

#!/bin/bash

#######################################################
# Create and run the containers = the virtual machines
######################################################

cd /home/
mkdir -p machines/
cd machines/

# For 22 students
# create directories
mkdir -p machine0{1..9}  # create machine01 to machine09
mkdir -p machine{10..22} # create machine10 to machine25


# this works
docker run --detach --name machine01  -e PASSWORD=inam         -p 8787:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine02  -e PASSWORD=mandy        -p 8788:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine03  -e PASSWORD=willard      -p 8789:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine04  -e PASSWORD=abi          -p 8790:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine05  -e PASSWORD=machiel      -p 8791:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine06  -e PASSWORD=myrthe       -p 8792:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine07  -e PASSWORD=sebastien    -p 8793:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine08  -e PASSWORD=bart         -p 8794:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine09  -e PASSWORD=roman        -p 8795:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine10  -e PASSWORD=lennart      -p 8796:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine11  -e PASSWORD=emy          -p 8797:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine12  -e PASSWORD=parcival     -p 8798:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine13  -e PASSWORD=kevin        -p 8799:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine14  -e PASSWORD=christel     -p 8800:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine15  -e PASSWORD=joelle       -p 8801:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine16  -e PASSWORD=shanna       -p 8802:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine17  -e PASSWORD=staf         -p 8803:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine18  -e PASSWORD=aboli        -p 8804:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine19  -e PASSWORD=mehran       -p 8805:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine20  -e PASSWORD=benjamin     -p 8806:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine21  -e PASSWORD=alessandra   -p 8807:8787 scienceparkstudygroup/master-gls:microbiome-latest
docker run --detach --name machine22  -e PASSWORD=anouk        -p 8808:8787 scienceparkstudygroup/master-gls:microbiome-latest










