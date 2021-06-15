FROM bioconductor/bioconductor_docker:RELEASE_3_10

WORKDIR /home/


## Install dependencies (Linux-based, R and related programs and other related packages) 
## Uses conda and mamba for this
## Dependencies are listed in environment.yaml
COPY ["environment.yaml", "./"]

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y remove bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    # mamba is a faster C++ re-implemenbtation of conda
    # name of the environment is rnaseq
    && conda install -c conda-forge mamba --yes \
    && mamba env create -f environment.yaml \
    && conda clean --all --yes

## Add to the PATH
ENV PATH /opt/conda/bin:$PATH
RUN echo "source activate metagenomics" > ~/.bashrc
ENV PATH /opt/conda/envs/metagenomics/bin:$PATH

## Add datasets for the course
RUN mkdir -p /home/data/ \
  && curl -SL -o /home/data/JC1ASEDIMENT120627.fasta  https://zenodo.org/record/4285901/files/JC1ASEDIMENT120627.fasta?download=1