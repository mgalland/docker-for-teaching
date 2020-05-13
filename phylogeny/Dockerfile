FROM continuumio/miniconda3:latest

LABEL author="l.fokkens@uva.nl" \
      description="A Docker image used to build a container that is used in the phylogenomics part of the GLS Master course Tools in Molecular Data Analysis" \
      usage="docker run --rm  scienceparkstudygroup/master-gls:phylogeny-latest" 

# Docker by default runs shell commands with /bin/sh, which isn’t supported by the conda activate command.
# Make RUN commands use `bash --login`:
SHELL ["/bin/bash", "--login", "-c"]

# bioconda channel has first priority, then conda-forge
RUN conda config --add channels conda-forge  \
&& conda config --add channels bioconda  


RUN conda create --name phylogeny --yes \
                        blast=2.9.0 \
                        muscle=3.8.31 \
                        iqtree=1.6.12 \
			bedtools=2.29.2 \
			trimal=1.4.1 \
			mummer=3.23 \
			gnuplot=5.2.7

# install a package Gnuplot needs 
RUN apt update
RUN apt install -y libgl1-mesa-glx

# install a command-line text editor
RUN apt-get install nano


# add data in case students need to run from a virtual machine 
RUN mkdir /home/plan_b
RUN mkdir /home/plan_b/genome_assemblies_cds_fasta

ADD genome_assemblies_cds_fasta /home/plan_b/genome_assemblies_cds_fasta

# add fastas with homologous BUSCO genes
RUN mkdir /home/BUSCO_fastas 
ADD BUSCO_fastas /home/BUSCO_fastas


# add python scripts for concatenation
RUN mkdir /home/python_scripts/
ADD python_scripts /home/python_scripts

# activate working environment
CMD ["bin/bash"]
CMD ["source", "activate", "phylogeny"]

