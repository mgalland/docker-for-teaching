FROM bioconductor/bioconductor_docker:RELEASE_3_10
                   	
LABEL author="m.galland@uva.nl" \
      description="A Docker image used to build a container for the RNA-seq course presently (2021-07-02) hosted at https://scienceparkstudygroup.github.io/rna-seq-lesson/index.html" \
      usage="docker run -e PASSWORD=mypasswd -p 8787:8787 mgalland/rna-seq-lesson" \
      url="http://localhost:8787" \
      rversion="3.6.2"


# Add datasets used for teaching to the image
COPY tutorial/ /home/rstudio/tutorial/
COPY deforges_2019/ /home/rstudio/deforges_2019/

# R packages. Specific versions are used here
RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2020-01-01/'))" \
      && R -e "install.packages('devtools')"  \
      && R -e "devtools::install_version('pheatmap', version = '1.0.12')" \
      && R -e "devtools::install_version('tidyverse', version = '1.3.0')" \
      && R -e "devtools::install_version('BiocManager', version = '1.30.10')" \
      && R -e "devtools::install_version('pwr', version = '1.2-0')" \
      && R -e "devtools::install_version('RColorBrewer', version = '1.0-5')" \
      && R -e "devtools::install_version('patchwork', version = '1.0.0')" \
      && R -e "devtools::install_version('splitstackshape', version = '1.4.6')" 

# Bioconductor R packages
RUN R -e "BiocManager::install('EnhancedVolcano', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('DESeq2', version = '3.10', update = FALSE)"  \
      && R -e "BiocManager::install('clusterProfiler', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('biomaRt', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('org.At.tair.db', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('Biostrings', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('vsn', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('apeglm', version = '3.10', update = FALSE)" 

# install biomart the latest since it depends on Bioconductor packages Biostrings and BiomaRt
RUN R -e "devtools::install_version('biomartr', version = '0.9.0')" 

# This docker image has LaTeX to build the vignettes
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -y --no-install-recommends \
    texlive \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-science \
    texi2html \
    texinfo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*