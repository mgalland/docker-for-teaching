# Docker images for the GLS Master course
These Docker files are used to build the computational environments of the Green Life Sciences Master course. The images are automatically tested and built on the DockerHub. 

All Docker images ready to use are available at the [Dockerhub master-gls repository](https://hub.docker.com/repository/docker/scienceparkstudygroup/master-gls/general).

Docker containers can be run. For domain-specific instructions, see the instructions below.  

<!-- MarkdownTOC autolink="True" levels="1,2,3" -->

- [1. Local usage](#1-local-usage)
	- [1.1 Open Data Science with R](#11-open-data-science-with-r)
	- [1.2 Phylogeny](#12-phylogeny)
	- [1.3 Microbiome](#13-microbiome)
	- [1.4 fastq](#14-fastq)
	- [1.5 RNA-seq](#15-rna-seq)
- [2. Cloud usage](#2-cloud-usage)
	- [2.1 One RStudio machine](#21-one-rstudio-machine)
	- [2.2 Multiple RStudio machines \(one per student\)](#22-multiple-rstudio-machines-one-per-student)
	- [2.3 Issues with user permissions and volume sharing with the host cloud machine](#23-issues-with-user-permissions-and-volume-sharing-with-the-host-cloud-machine)
	- [2.4 Useful Docker commands](#24-useful-docker-commands)
- [3.Digital Ocean command-line interface](#3digital-ocean-command-line-interface)
	- [3.1 The doctl CLI](#31-the-doctl-cli)
	- [3.2 Listing droplets](#32-listing-droplets)
	- [3.3 Creating one or multiple droplets](#33-creating-one-or-multiple-droplets)
	- [3.2 Useful commands](#32-useful-commands)
- [3. References](#3-references)
	- [3.1 Linux-based containers](#31-linux-based-containers)
	- [3.2 RStudio containers](#32-rstudio-containers)
	- [3.3 Useful links](#33-useful-links)
	- [3.4 Social media repository picture](#34-social-media-repository-picture)

<!-- /MarkdownTOC -->



# 1. Local usage

To test it locally, you'll need to install Docker Desktop first: see instructions at [docker desktop](https://www.docker.com/products/docker-desktop).


## 1.1 Open Data Science with R
Based on the DockerHub `rocker/tidyverse` image but with three added libraries (`skimr`, `plotly` and `nycflights13`).     
`docker run --rm --name rstudio_instance -e PASSWORD=mypwd -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest`

Then navigate to [http://localhost:8787](http://localhost:8787) in your web browser. You should have an RStudio session running. Type `rstudio` as the user name and your password. 


__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.    
The `--name` gives a name to the running container for easy retrieval.
The `-p 8787:8787` follow the format `-p host_port:container_port`. Therefore the port 8787 inside the container will be exposed to the outside port on the host machine. That way, the running instance of RStudio can be access through the <IP address>:port format.


## 1.2 Phylogeny
The `phylogeny/` folder contains the Docker file used to build the image.   

**The Docker image contains:**
- ncbi-blast version 2.9.0 
- muscle version 3.8.31
- seqinr version 3.4_5 
- iqtree=1.6.12

To use it locally on your machine:
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm -it -v $PWD:/home/ scienceparkstudygroup/master-gls:phylogeny-latest`

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.    
The `--it` starts an interactive session (so you enter the shell directly).  
The `-v` mounts your current working directory onto the `/home/` folder inside your container. That way, you can access the files in your working directory _from_ within the container. 


## 1.3 Microbiome
A Dockerfile to follow the [Carpentry-style microbiota data analysis lesson](https://scienceparkstudygroup.github.io/microbiome-lesson/).

**This Docker image contains:**
- Three datasets called `data_loue_16S_nonnorm_grp.txt`, `data_loue_16S_nonnorm_taxo.txt` and `data_loue_16S_nonnorm.txt`.
- `vegan` version 2.5-6
- `tidyverse` version 1.3.0
- `pheatmap` version 1.0.12
- `ade4` version 1.7-10
- `multcomp` version 1.4-10
- `patchwork` version 1.0.0
- `agricolae` version 1.3-0
- `FSA` version 0.8.27
- `rcompanion` version 2.3.0
- `phyloseq` version 3.10 

**To use it locally on your machine:** 
To use it locally on your machine:
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm --name rstudio -e PASSWORD=<choose a password> -p 8787:8787 scienceparkstudygroup/master-gls:microbiome-latest`.
4. In a web browser, open this link: [http://localhost:8787](http://localhost:8787).
5. Finally enter `rstudio` as the user name and your select password. 

## 1.4 fastq
A Dockerfile to perform the command-line parts of the [Carpentry-style RNA-seq lesson](https://scienceparkstudygroup.github.io/rna-seq-lesson/index.html): the "fastq NGS quality check" and the "fastq to counts" section.   
In addition, it can also be used to teach the [Carpentry Shell lesson](http://swcarpentry.github.io/shell-novice/).

**The Docker image contains:**
* The `data-shell/` dataset [from the Shell novice lesson](http://swcarpentry.github.io/shell-novice/setup.html).
* A genome consisting of a single chromosome.
* Four subsampled RNA-seq fastq files.

**To use it locally on your machine:**
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm -it scienceparkstudygroup/master-gls:fastq-latest`.
4. You will enter inside the container where you can execute bash commands. 

## 1.5 RNA-seq
A Dockerfile for the [Carpentry-style RNA-seq lesson](https://scienceparkstudygroup.github.io/rna-seq-lesson/index.html).  
The image is based on a [Docker Bioconductor image release 3.10](bioconductor/bioconductor_docker:RELEASE_3_10).  

**The Docker image contains:**  
* `devtools` (from the MRAN microsoft CRAN mirror of 2020/01/01.
* `pheatmap` version 1.0.12
* `tidyverse` version 1.3.0
* `BiocManager` version 1.30.1 
* `EnhancedVolcano` version 3.10
* `DESeq2` version 3.10
* One dataset and one design file that are available [here](https://zenodo.org/record/3666262) and described [here](https://scienceparkstudygroup.github.io/rnaseq-lesson/setup.html):
  - `counts.tsv`
  - `experimental_design_modified.tsv` 

**To use it locally on your machine:**
1. Open a Shell window (command-line interface). 
2. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm --name rstudio -e PASSWORD=<choose a password> -p 8787:8787 scienceparkstudygroup/master-gls:rna-latest`.
4. In a web browser, open this link: [http://localhost:8787](http://localhost:8787).
5. Finally enter `rstudio` as the user name and your select password.  

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.      
The base image is built on a RStudio server that will ask you for two things: a user name that is always __rstudio__ and __a password__ which is one you have to create. You will be asked for a user name and a password.

This RNA-seq Docker image also contains datasets:  
- Dataset 1: the raw and scaled counts from the [NASA GeneLab GSL38 RNA-seq and proteomics experiment](https://genelab-data.ndc.nasa.gov/genelab/accession/GLDS-38/).

# 2. Cloud usage

For now, I have relied on the [Digital Ocean cloud computing platform](https://www.digitalocean.com/) to deploy Docker containers that in turn serve RStudio instances. 

## 2.1 One RStudio machine

If you only want to run one RStudio virtual machine, then follow these steps:

1. First, create a project to host a "Digital Ocean droplet" (virtual machine). This machine will serve to deploy N virtual machines (one VM per student).
2. In the 'Marketplace' tab, choose the Docker apps which will starts a Virtual Machine with the Linux distribution Ubuntu 18.04 and Docker CE version VERSION 18.06.1 or higher. [Find it here](https://marketplace.digitalocean.com/apps/docker).
3. Open a Shell terminal and connect through `ssh` to your machine e.g. `ssh root@ip` and enter the Digital Ocean provided password. The IP address will be indicated in your "Droplets" sidebar. For example, use `ssh root@134.209.84.69` if your IP address is `134.209.84.69`.
4. Start `screen` to make sure that your VM stays up and running when you log out / turn off your computer. [See this help forum](https://www.digitalocean.com/community/questions/how-keep-my-app-running-after-close-putty-f82aab17-ca84-46a0-8a39-3e25f1dd2d45).
5. Run the appropriate Docker command e.g. `docker run --rm --name rstudio -e PASSWORD=mypwd -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest`. (choose the appropriate Docker image). You can define your own username and password. 
6. Your app should be running at its defined IP address.

## 2.2 Multiple RStudio machines (one per student)
If you want to run multiple containers (e.g. one per student), you need to perform the same steps as for a single machine (see above). The difference is that 
expose a different port on the host each time. 

Here's an example for two students:
* Student 1 ("machine-01"): `docker run --detach --name machine-01 -v ~/machines/machine01/:/home/rstudio/ -e PASSWORD=student01 -p 8080:8787 scienceparkstudygroup/master-gls:openr-latest`
* Student 2 ("machine-02"): `docker run --detach --name machine-02 -v ~/machines/machine02/:/home/rstudio/ -e PASSWORD=student02 -p 8081:8787 scienceparkstudygroup/master-gls:openr-latest`

Notice that student 1 uses port _8080_ while student 2 uses port _8081_. 

... etc ...

A small Python script called [`create_docker_commands_for_students.py`](./bin/create_docker_commands_for_students.py) is available and can be used on a file called `students.tsv` with tabulated-separated values with the following format: 

| student  | machine    | password |   port |
|----------|------------|--------- |---------|
| John Doe | machine-01 |  john   |  8787   |
| Jane Doe | machine-02 |  jane   |  8788   |

In a Python virtual environment with `pandas` available, run the following command:   
```shell
python create_docker_commands_for_students.py students.tsv 
```
This will create the Docker commands that can be copy-pasted in the shell of the cloud instance:

```bash
docker run --name machine-01 -e PASSWORD=john -p 8787:8787 scienceparkstudygroup/master-gls:openr-latest
docker run --name machine-02 -e PASSWORD=jane -p 8787:8788 scienceparkstudygroup/master-gls:openr-latest
```

In this way, you can have one machine per student, each one on its own port with its own password.

## 2.3 Issues with user permissions and volume sharing with the host cloud machine
See this blog post: https://medium.com/@mccode/understanding-how-uid-and-gid-work-in-docker-containers-c37a01d01cf

## 2.4 Useful Docker commands

- Stop all containers: `docker stop $(docker ps -a -q)`
- To restart them, use this: `docker start <container_id or container_name>`
- Remove stopped containers: `docker rm $(docker ps -a -q)`
- Remove ALL containers: This will remove both stopped and running containers. Beware! `docker rm $(docker ps -a -q)`
- :warning: Remove all images: `docker rmi $(docker images -q) --force`

# 3.Digital Ocean command-line interface

Droplets are Linux-based Virtual Machines that can be created and deleted on demand. 

## 3.1 The doctl CLI
Digital Ocean has a `docl` command-line interface that can be used to perform actions programmatically.   
This is useful when multiple droplets need to be created or modified for instance. 

[__Link to the doctl documantion__](https://www.digitalocean.com/docs/apis-clis/doctl/)

To use `doctl` you will need to create an access token (DO > API). 
Assign a bash environmental variable (that stays on your computer) to keep it secret when recording commands. 

```bash
echo "export DO_TOKEN=you_secret_token" >> ~/.bash_profile   # to create an env variable called $DO_TOKEN  
source ~/.bash_profile   # to activate your profile
```

This creates the `$DO_TOKEN` environmental variable that you can use to authenticate with the `doctl` command-line. 

## 3.2 Listing droplets

It is often useful to list the available droplets, their CPUs, etc. in order to create multiple ones with the same configuration for instance. 

To list all available droplets, type:  
```bash
doctl compute size list
```
```bash
Slug                  Memory    VCPUs    Disk    Price Monthly    Price Hourly
s-1vcpu-1gb           1024      1        25      5.00             0.007440
s-1vcpu-1gb-amd       1024      1        25      6.00             0.008930
s-1vcpu-1gb-intel     1024      1        25      6.00             0.008930
s-1vcpu-2gb           2048      1        50      10.00            0.014880
s-1vcpu-2gb-amd       2048      1        50      12.00            0.017860
s-1vcpu-2gb-intel     2048      1        50      12.00            0.017860
s-2vcpu-2gb           2048      2        60      15.00            0.022320
s-2vcpu-2gb-amd       2048      2        60      18.00            0.026790
s-2vcpu-2gb-intel     2048      2        60      18.00            0.026790
```

You can use a regular grep to filter this list. 
For instance, to get the __memory-optimized droplets__ that start with an "m", grep them with:  
```bash
doctl compute size list |grep "^m-"
```

The "slug" column contains the short description of the machine configuration. You will have to specify it when creating the machines. 



__To get a list of your running droplets, type:__
```bash
doctl compute droplet list --format "ID,Name,PublicIPv4" 
```

## 3.3 Creating one or multiple droplets

This is taken directly from the DO API: https://www.digitalocean.com/docs/apis-clis/api/example-usage/ 

```bash
curl -X POST "https://api.digitalocean.com/v2/droplets" \
	-d'{"name":"machine-01","region":"ams3","size":"s-1vcpu-1gb","image":"ubuntu-20-04-x64"}' \
	-H "Authorization: Bearer $DO_TOKEN" \
	-H "Content-Type: application/json"
```

To create multiple droplets (called "sub-01.example.com", "sub-02.example.com")
```bash
curl -X POST "https://api.digitalocean.com/v2/droplets" \
	-d'{"names":["sub-01.example.com","sub-02.example.com"],"region":"ams3","size":"s-1vcpu-1gb","image":"ubuntu-20-04-x64"}' \
	-H "Authorization: Bearer $DO_TOKEN" \
	-H "Content-Type: application/json"
```

## 3.2 Useful commands

The API reference has some useful commands [here](https://www.digitalocean.com/docs/apis-clis/api/example-usage/).

Here is an non-exhaustive list:





# 3. References

## 3.1 Linux-based containers
For the phylogeny course and the RNA-seq courses.

## 3.2 RStudio containers
For the microbiome and RNA-seq courses.
* Docker containers for Bioconductor: [https://www.bioconductor.org/help/docker/](https://www.bioconductor.org/help/docker/).
* [The Rocker project](https://www.rocker-project.org/).
* [Tutorials on Docker images for R and RStudio](https://ropenscilabs.github.io/r-docker-tutorial/).

## 3.3 Useful links
* [Docker run reference](https://docs.docker.com/engine/reference/commandline/run/)
* [A clear overview of Docker best practices](https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/#copy-vs-add)
* A collection of Docker images for bioinformatics: [https://pegi3s.github.io/dockerfiles/](https://pegi3s.github.io/dockerfiles/)
* [Docker and conda interaction](https://pythonspeed.com/articles/activate-conda-dockerfile/)
* [https://www.configserverfirewall.com/docker/start-container-docker-run-command/#port-mapping](https://www.configserverfirewall.com/docker/start-container-docker-run-command/#port-mapping)
* [Best practices for Dockerfiles](https://biocontainers-edu.readthedocs.io/en/latest/best_practices.html)

## 3.4 Social media repository picture
[Andrew Bain on Unsplash](https://unsplash.com/photos/zJ-9FHfTQzQ).
