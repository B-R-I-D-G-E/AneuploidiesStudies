FROM rocker/tidyverse:latest

USER root
RUN chown -R rstudio:rstudio /home/rstudio/
RUN apt install unzip -y
RUN Rscript -e "install.packages('BiocManager')"
RUN Rscript -e "BiocManager::install('ComplexHeatmap')"
RUN Rscript -e "BiocManager::install('karyoploteR')"
RUN Rscript -e "BiocManager::install('GenomicRanges')"

RUN install2.r --error --deps TRUE \
    dplyr \
    ggplot2 \
    ggrepel \
    ggpubr \
    rmarkdown \
    circlize \
    ggfortify \
    vegan \
    patchwork \
    ggforce \
    plotly \
    stringr \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN rm -fr /var/lib/apt/lists/*
RUN apt autoremove && apt update -y && apt install -y --no-install-recommends libxt6 imagemagick
RUN mkdir /appdata
COPY ./testdata/test_data.zip /appdata
RUN \
    cd /appdata && \
    unzip test_data.zip

COPY ./scripts/* /home/rstudio/
RUN chown -R rstudio:rstudio /home/rstudio/
WORKDIR /home/rstudio
ENTRYPOINT ["/bin/bash"]

