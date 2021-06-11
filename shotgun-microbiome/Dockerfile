FROM continuumio/miniconda3:4.9.2

WORKDIR /home/


## Install dependencies (Linux-based, R and related programs and other related packages) 
## Uses conda and mamba for this
## Dependencies are listed in environment.yaml
COPY ["environment.yaml", "./"]

# mamba is a faster C++ re-implemenbtation of conda
# name of the environment is rnaseq
RUN conda install -c conda-forge mamba --yes \
  && mamba env create -f environment.yaml \
  && conda clean --all

## Add to the PATH
RUN echo "source activate metagenomics" > ~/.bashrc
ENV PATH /opt/conda/envs/metagenomics/bin:$PATH

## Add datasets for the course
RUN mkdir -p /home/data/ \
  && curl -SL -o /home/data/JC1ASEDIMENT120627.fasta  https://zenodo.org/record/4285901/files/JC1ASEDIMENT120627.fasta?download=1

