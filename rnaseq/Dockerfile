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
ADD differential_genes.tsv /home/rstudio/

# R packages. Specific versions are used here
RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2020-01-01/'))" \
      && R -e "install.packages('devtools')"  \
      && R -e "devtools::install_version('pheatmap', version = '1.0.12')" \
      && R -e "devtools::install_version('tidyverse', version = '1.3.0')" \
      && R -e "devtools::install_version('BiocManager', version = '1.30.10')" \
      && R -e "devtools::install_version('biomartr', version = '0.9.0')"
      

# Bioconductor R packages
RUN R -e "BiocManager::install('EnhancedVolcano', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('DESeq2', version = '3.10', update = FALSE)"  \
      && R -e "BiocManager::install('clusterProfiler', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('biomaRt', version = '3.10', update = FALSE)" \
      && R -e "BiocManager::install('org.At.tair.db', version = '3.10', update = FALSE)" 

# Version-stable CTAN repo from the tlnet archive at texlive.info, used in the
# TinyTeX installation: chosen as the frozen snapshot of the TeXLive release
# shipped for the base Debian image of a given rocker/r-ver tag.
# Debian buster => TeXLive 2018, frozen release snapshot 2019/02/27
ARG CTAN_REPO=${CTAN_REPO:-https://www.texlive.info/tlnet-archive/2019/02/27/tlnet}
ENV CTAN_REPO=${CTAN_REPO}

ENV PATH=$PATH:/opt/TinyTeX/bin/x86_64-linux/

## Add LaTeX, articles and bookdown support
RUN wget "https://travis-bin.yihui.name/texlive-local.deb" \
  && dpkg -i texlive-local.deb \
  && rm texlive-local.deb \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    default-jdk \
    fonts-roboto \
    ghostscript \
    less \
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    libhunspell-dev \
    libjpeg-dev \
    libmagick++-dev \
    libopenmpi-dev \
    librdf0-dev \
    libtiff-dev \
    libv8-dev \
    libzmq3-dev \
    qpdf \
    ssh \
    texinfo \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  ## Use tinytex for LaTeX installation
  && install2.r --error tinytex \
  ## Admin-based install of TinyTeX:
  && wget -qO- \
    "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | \
    sh -s - --admin --no-path \
  && mv ~/.TinyTeX /opt/TinyTeX \
  && if /opt/TinyTeX/bin/*/tex -v | grep -q 'TeX Live 2018'; then \
      ## Patch the Perl modules in the frozen TeX Live 2018 snapshot with the newer
      ## version available for the installer in tlnet/tlpkg/TeXLive, to include the
      ## fix described in https://github.com/yihui/tinytex/issues/77#issuecomment-466584510
      ## as discussed in https://www.preining.info/blog/2019/09/tex-services-at-texlive-info/#comments
      wget -P /tmp/ ${CTAN_REPO}/install-tl-unx.tar.gz \
      && tar -xzf /tmp/install-tl-unx.tar.gz -C /tmp/ \
      && cp -Tr /tmp/install-tl-*/tlpkg/TeXLive /opt/TinyTeX/tlpkg/TeXLive \
      && rm -r /tmp/install-tl-*; \
    fi \
  && /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install ae inconsolata listings metafont mfware parskip pdfcrop tex \
  && tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin \
  && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
  && install2.r --error PKI \
  ## And some nice R packages for publishing-related stuff
  && install2.r --error --deps TRUE \
    bookdown rticles rmdshower rJava