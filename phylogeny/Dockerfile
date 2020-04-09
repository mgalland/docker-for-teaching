FROM continuumio/miniconda3:latest

LABEL author="m.galland@uva.nl" \
      description="A Docker image used to build a container usable for the phylogeny part of the GLS Master course presently (2020-04-08)" \
      usage="docker run --rm  scienceparkstudygroup/master-gls:phylogeny-latest" 

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV PATH /opt/conda/envs/env/bin:$PATH

# bioconda channel has first priority then r then conda-forge
RUN conda config --add channels conda-forge  \
  && conda config --add channels r           \
  && conda config --add channels bioconda  


