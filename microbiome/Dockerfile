FROM bioconductor/bioconductor_docker:RELEASE_3_10
                   	
LABEL author="m.galland@uva.nl" \
      description="A Docker image used to build a container usable for a 16S rRNA microbiome course presently (2020-04-02) hosted at https://github.com/ScienceParkStudyGroup/microbiome-lesson" \
      usage="docker run -e PASSWORD=mypasswd -p 8787:8787 scienceparkstudygroup/master-gls:microbiome-latest" \
      url="http://localhost:8787" \
      rversion="3.6.2"


# Add datasets used for teaching to the image
ADD data_loue_16S_nonnorm_grp.txt /home/rstudio/
ADD data_loue_16S_nonnorm_taxo.txt /home/rstudio/
ADD data_loue_16S_nonnorm.txt /home/rstudio/


# R packages. Specific versions are used here
RUN R -e "install.packages('devtools', repos = 'http://mran.revolutionanalytics.com/snapshot/2020-01-01/')"  \
      && R -e "devtools::install_version('vegan', version = '2.5-6')" \
      && R -e "devtools::install_version('tidyverse', version = '1.3.0')" \
      && R -e "devtools::install_version('pheatmap', version = '1.0.12')" \
      && R -e "devtools::install_version('ade4', version = '1.7-10')" \
      && R -e "devtools::install_version('multcomp', version = '1.4-10')"  
      && R -e "devtools::install_version('patchwork', version = '1.0.0')"  
      && R -e "devtools::install_version('agricolae', version = '1.3-0')"  

      
# Bioconductor R packages 
RUN R -e "devtools::install_version('BiocManager', version = '1.30.10')" \
     && R -e "BiocManager::install('phyloseq', version = '3.10', update = FALSE)" 


