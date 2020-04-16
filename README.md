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


# Local usage

To test it locally, you'll need to install Docker Desktop first: see instructions at [docker desktop](https://www.docker.com/products/docker-desktop).


## Open Data Science with R
Based on the DockerHub `rocker/tidyverse` image but with three added libraries (`skimr`, `plotly` and `nycflights13`).     
`docker run --rm --name rstudio_instance -e PASSWORD=mypwd -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest`

Then navigate to [http://localhost:8787](http://localhost:8787) in your web browser. You should have an RStudio session running. Type `rstudio` as the user name and your password. 


__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.    
The `--name` gives a name to the running container for easy retrieval.
The `-p 8787:8787` follow the format `-p host_port:container_port`. Therefore the port 8787 inside the container will be exposed to the outside port on the host machine. That way, the running instance of RStudio can be access through the <IP address>:port format.


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
4. In a web browser, open this link: [http://localhost:8787](http://localhost:8787).
5. Finally enter `rstudio` as the user name and your select password.  

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.      
The base image is built on a RStudio server that will ask you for two things: a user name that is always __rstudio__ and __a password__ which is one you have to create. You will be asked for a user name and a password.



# Cloud usage

## Digital Ocean

### Single container: one RStudio session
If you only want to run one RStudio session, then follow these steps:

1. First, create a project to host all your "droplets" (virtual machines). There will be one droplet per student / course participant. 
2. In the 'Marketplace' tab, choose the Docker apps which will starts a Virtual Machine with Ubuntu 18.04 and Docker CE version VERSION 18.06.1 or higher.
3. Open a Shell terminal and connect through `ssh` to your machine e.g. `ssh root@ip` and enter the Digital Ocean provided password.
4. Start `screen` to make sure that your VM stays up and running when you log out / turn off your computer. [See this help forum](https://www.digitalocean.com/community/questions/how-keep-my-app-running-after-close-putty-f82aab17-ca84-46a0-8a39-3e25f1dd2d45).
5. Run the appropriate Docker command e.g. `docker run --rm --name rstudio -e PASSWORD=mypwd -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest`. 
6. Your app should be running at its defined IP address.

### Multiple containers: N = ... RStudio sessions
If you want to run multiple containers (e.g. one per student), you need to expose a different port on the host each time. 

Here's an example for two students:
* Student 1 ("machine-01"): `docker run --detach --name machine-01 -v ~/machines/machine01/:/home/rstudio/ -e PASSWORD=student01 -p 8080:8787 scienceparkstudygroup/master-gls:openr-latest`
* Student 2 ("machine-02"): `docker run --detach --name machine-02 -v ~/machines/machine02/:/home/rstudio/ -e PASSWORD=student02 -p 8081:8787 scienceparkstudygroup/master-gls:openr-latest`



docker run --detach --name rstudio1 -e PASSWORD=mypwd -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest
docker run --detach --name rstudio2 -e PASSWORD=mypwd -p 8788:8787 scienceparkstudygroup/master-gls:openr-latest

### Stop all containers
`docker stop $(docker ps -q)`

To restart them, use this:
`docker start <container_id or container_name>`

### Remove stopped containers
`docker rm $(docker ps -q)`

### Remove ALL containers
This will remove both stopped and running containers. Beware!
`docker rm $(docker ps -a -q)`

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
* [https://www.configserverfirewall.com/docker/start-container-docker-run-command/#port-mapping](https://www.configserverfirewall.com/docker/start-container-docker-run-command/#port-mapping)

## Social media repository picture
[Andrew Bain on Unsplash](https://unsplash.com/photos/zJ-9FHfTQzQ).