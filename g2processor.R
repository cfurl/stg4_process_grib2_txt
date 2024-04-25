library(dplyr)
library(readr)
library(stringr)

#read in your csv for AOI it should have grib_id, hrap_x, hrap_y, center_lon, center_lat for grib2 cells
aoi_texas_buffer<-read_csv(paste0(getwd(),"/texas_buffer_spatial_join.csv"))

#starts with st4_conus. and ends with .txt
raw_grib2_text<-list.files(getwd(),pattern = "^st4_conus.*.txt$",full.names=FALSE)
h<-list.files(getwd(),pattern = "^st4_conus.*.txt$",full.names=FALSE)

for (h in raw_grib2_text) {
  
  name <- h |>
    str_replace("st4_conus.", "t") |>
    str_replace(".01h.txt","")
  
  aa<-read_csv(paste0(getwd(),"\\",h), col_names=c("x1","x2","x3","x4","center_lon","center_lat",name)) %>%
    select(-x1,-x2,-x3,-x4) 
  
  bb<- left_join(aoi_texas_buffer,aa,by=NULL)
    }  



