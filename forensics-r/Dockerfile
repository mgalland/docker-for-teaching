FROM rocker/verse:3.6.2
                   	
LABEL author="m.galland@uva.nl" \
      description="A Docker image used for the Master Forensics course hosted at https://carpentries-incubator.github.io/open-science-with-r/index.html" \
      usage="docker run -e PASSWORD=mypasswd -p 8787:8787 scienceparkstudygroup/master-gls:forensics-latest" \
      url="http://localhost:8787" \
      rversion="3.6.2"

# Add datasets used for teaching to the image
COPY GTEx_Analysis_2016-01-15_v7_RNASeQCv1.1.8_gene_median_tpm.tsv /home/rstudio/data/
COPY mypca.R /home/rstudio/

# R packages. Specific versions are used here
RUN R -e "install.packages('devtools', repos = 'http://mran.revolutionanalytics.com/snapshot/2020-01-01/')"  \
      && R -e "devtools::install_version('skimr', version = '2.0')" \
      && R -e "devtools::install_version('plotly', version = '4.9.2')" \
      && R -e "devtools::install_version('patchwork', version = '1.0.0')" \
      && R -e "devtools::install_version('GGally')" \
      && R -e "devtools::install_version('ggrepel')" 


