FROM bioconductor/bioconductor_docker:RELEASE_3_10
                   	
LABEL author="m.galland@uva.nl" \
      description="A Docker image used to build a container usable for RNA-seq course presently (2020-04-02) hosted at https://scienceparkstudygroup.github.io/rna-seq-lesson/index.html" \
      usage="docker run -e PASSWORD=mypasswd -p 8787:8787 mgalland/rna-seq-lesson" \
      url="http://localhost:8787" \
      rversion="3.6.2"


# Add datasets used for teaching to the image
ADD counts.tsv /home/rstudio/
ADD experimental_design_modified.tsv /home/rstudio/
ADD normalization_function.R /home/rstudio/

# R packages. Specific versions are used here
RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2020-01-01/'))" \
      && R -e "install.packages('devtools')"  \
      && R -e "devtools::install_version('pheatmap', version = '1.0.12')" \
      && R -e "devtools::install_version('tidyverse', version = '1.3.0')" \
      && R -e "devtools::install_version('BiocManager', version = '1.30.10')"
      

# Bioconductor R packages
RUN R -e "BiocManager::install('EnhancedVolcano', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('DESeq2', version = '3.10', update = FALSE)"  


