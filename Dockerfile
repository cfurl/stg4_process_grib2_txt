FROM rocker/r-ver:4.2.2

RUN mkdir -p /home
RUN mkdir -p /gis
RUN mkdir -p /output
RUN mkdir -p /data
WORKDIR /home

RUN apt-get update && \
  apt-get install -y libproj22 libudunits2-0 libgdal30 && \
  rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('dplyr','stringr','readr','Rcpp','sf','ggplot2'))"

COPY texas_buffer_spatial_join.csv /gis/
COPY texas_grib_bins_clipped.dbf /gis/
COPY texas_grib_bins_clipped.prj /gis/
COPY texas_grib_bins_clipped.qpj /gis/
COPY texas_grib_bins_clipped.shp /gis/
COPY texas_grib_bins_clipped.shx /gis/
COPY g2processor.R /home/

CMD Rscript g2processor.R