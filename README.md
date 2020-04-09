# Docker images for the GLS Master course
These Docker files are used to build the computational environments of the Green Life Sciences Master course. The images are automatically tested and built on the DockerHub. 

All Docker images ready to use are available at the [Dockerhub master-gls repository](https://hub.docker.com/repository/docker/scienceparkstudygroup/master-gls/general).

Docker containers can be run. For domain-specific instructions, see the instructions below.  You 

**Table of contents**
- [Local machine usage](#local-machine-usage)
  - [Phylogeny](#phylogeny)
  - [Microbiome](#microbiome)
  - [RNA-seq](#rna-seq)
- [Usage in the cloud](#usage-in-the-cloud)
  - [SURFsara](#surfsara)
  - [Digital Ocean](#digital-ocean)
- [References](#references)
  - [Linux-based containers](#linux-based-containers)
  - [RStudio containers](#rstudio-containers)
  - [Useful links](#useful-links)
  - [Social media repository picture](#social-media-repository-picture)


# Local machine usage

To test it locally, you'll need to install Docker Desktop first: see instructions at [docker desktop](https://www.docker.com/products/docker-desktop).

## Phylogeny
The `phylogeny/` folder contains the Docker file used to build the image.   

**The Docker image contains:**
* ncbi-blast version 2.9.0 
* muscle version 3.8.31
* seqinr version 3.4_5 
* iqtree=1.6.12

To use it locally on your machine:
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm -it -v $PWD:/home/ scienceparkstudygroup/master-gls:phylogeny-latest`

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.    
The `--it` starts an interactive session (so you enter the shell directly).  
The `-v` mounts your current working directory onto the `/home/` folder inside your container. That way, you can access the files in your working directory _from_ within the container. 


## Microbiome
An RStudio server can be run with ...

## RNA-seq
A Dockerfile for the [Carpentry-style RNA-seq lesson](https://scienceparkstudygroup.github.io/rna-seq-lesson/index.html).  
The image is based on a [Docker Bioconductor image release 3.10](bioconductor/bioconductor_docker:RELEASE_3_10).  

**The Docker image contains:**
* devtools (from the MRAN microsoft CRAN mirror of 2020/01/01.
* pheatmap version 1.0.12
* tidyverse version 1.3.0
* BiocManager version 1.30.1 
* EnhancedVolcano version 3.10
* DESeq2 version 3.10

And two datasets called `counts.tsv` and `experimental_design_modified.tsv` that are available [here](https://zenodo.org/record/3666262) and described [here](https://scienceparkstudygroup.github.io/rnaseq-lesson/setup.html).

To use it locally on your machine:
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm --name rstudio -e PASSWORD=<choose a password> -p 8787:8787 scienceparkstudygroup/master-gls:rna-latest`.
4. In a web browser, copy-paste this link: `http://localhost:8787`.
5. Finally enter `rstudio` as the user name and your select password.  

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.    
The base image is built on a RStudio server that will ask you for two things: a user name that is always __rstudio__ and __a password__ which is one you have to create. You will be asked for a user name and a password.



# Usage in the cloud

## SURFsara

Instructions here...

## Digital Ocean

Instructions here...

# References

## Linux-based containers
For the phylogeny course and the RNA-seq courses.


## RStudio containers
For the microbiome and RNA-seq courses.
* Docker containers for Bioconductor: [https://www.bioconductor.org/help/docker/](https://www.bioconductor.org/help/docker/).
* [The Rocker project](https://www.rocker-project.org/).
* [Tutorials on Docker images for R and RStudio](https://ropenscilabs.github.io/r-docker-tutorial/).


## Useful links
* [Docker run reference](https://docs.docker.com/engine/reference/commandline/run/)
* A collection of Docker images for bioinformatics: [https://pegi3s.github.io/dockerfiles/](https://pegi3s.github.io/dockerfiles/)
* [Docker and conda interaction](https://pythonspeed.com/articles/activate-conda-dockerfile/)

## Social media repository picture
[Andrew Bain on Unsplash](https://unsplash.com/photos/zJ-9FHfTQzQ).