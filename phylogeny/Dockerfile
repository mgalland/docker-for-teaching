FROM continuumio/miniconda3:latest

LABEL author="l.fokkens@uva.nl" \
      description="A Docker image used to build a container that is used in the phylogenomics part of the GLS Master course Tools in Molecular Data Analysis" \
      usage="docker run --rm  scienceparkstudygroup/master-gls:phylogeny-latest" 

# Make RUN commands use `bash --login`:
SHELL ["/bin/bash", "--login", "-c"]

# bioconda channel has first priority then r then conda-forge
RUN conda config --add channels conda-forge  \
&& conda config --add channels bioconda  


RUN conda create --name phylogeny --yes \
                        blast=2.9.0 \
                        muscle=3.8.31 \
                        iqtree=1.6.12 \
			bedtools=2.29.2 \
			trimal=1.4.1

# install a command-line text editor
RUN apt-get install nano


# activate working environment
RUN conda init bash 
RUN conda activate phylogeny 

CMD ["bin/bash"]