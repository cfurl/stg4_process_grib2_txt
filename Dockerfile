FROM rocker/r-ver:4.2.2
RUN apt-get update && \
  apt-get install -y libproj22 libudunits2-0 libgdal30 && \
  rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('dplyr','stringr','readr','Rcpp','sf','ggplot2'))"
WORKDIR /home/stg4_process_grib2_txt
COPY g2processor.R g2processor.R
CMD Rscript g2processor.R