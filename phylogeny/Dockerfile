FROM continuumio/miniconda3:latest

LABEL author="m.galland@uva.nl" \
      description="A Docker image used to build a container usable for the phylogeny part of the GLS Master course presently (2020-04-08)" \
      usage="docker run --rm  scienceparkstudygroup/master-gls:phylogeny-latest" 

# Make RUN commands use `bash --login`:
SHELL ["/bin/bash", "--login", "-c"]

# bioconda channel has first priority then r then conda-forge
RUN conda config --add channels conda-forge  \
  && conda config --add channels r           \
  && conda config --add channels bioconda  

# install packages
RUN conda create --name phylogeny --yes \
                        blast=2.9.0 \
                        muscle=3.8.31 \
                        r-seqinr=3.4_5 \
                        iqtree=1.6.12

# activate working environment
RUN conda init bash \
  && conda activate phylogeny 

CMD ["bin/bash"]