FROM continuumio/miniconda3:latest

LABEL author="m.galland@uva.nl" \
      description="A Docker image used to create a container usable for the bioinformatic part of the RNA-seq lesson of the GLS Master course (2020-04-08)" \
      usage="docker run --rm  scienceparkstudygroup/master-gls:fastq-latest" 

# Make RUN commands use `bash --login`:
SHELL ["/bin/bash", "--login", "-c"]


# Add files for "From fastq to read counts" episodes
ADD rna-seq-files/ /datasets/


# install nano
RUN apt-get install nano

# bioconda channel has first priority then r then conda-forge
RUN conda config --add channels conda-forge  \
  && conda config --add channels r           \
  && conda config --add channels bioconda  

# install packages
RUN conda create --name fastq --yes \
                        star=2.7.3a \
                        trimmomatic=0.38 \
                        samtools=1.10 \
                        fastqc=0.11.9 \
                        subread=2.0.0 \
     && conda clean -afy 

# activate working environment
RUN /bin/bash -c "source activate fastq"

CMD ["bin/bash"]

