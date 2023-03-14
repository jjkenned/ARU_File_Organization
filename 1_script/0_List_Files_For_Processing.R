#######################################################
########### Manage RTS Tracking Data ##################
#######################################################


# Re-set  your script when needed
dev.off()
rm(list=ls())

# libraries
library(tidyverse)
library(stringr)

#### Part 1 ~ Listing Files ####

## Step 1 - Location and listing

# Set folders where all files are kept
path = "D:/PMRA_SAR/processing/Timelapse_files/RTS/BIRD/2022/MKVI/MKVI-22"
depth = 2

# List nights transect/station/region etc
# shortcut functions for listing paths and files


# list the folders for each night applied to only folders containing RTS images
list.nights = function(path){
  
  # list files (only JPG to get rid of possible shorter path files)
  files = data.frame(full.name = (list.files(path = path,pattern = ".jpg",all.files = T,full.names = T,recursive = T)))
  
  # remove any paths that dont contain 'clipped'. This is slightly redundant most of the time as clipped files are jpg and raw files are png
  files = filter(files,grepl("clipped",full.name))
  
  # get night names
  files$night.path = dirname(files$full.name)
  
  
  # keep only night names
  nights = data.frame(full.path = unique(files$night.path))
  
  # get station IDs and night IDs for this
  nights$night = basename(nights$full.path)
  nights$station = basename(dirname(nights$full.path))
  nights$transect = basename(dirname(dirname(dirname(nights$full.path))))

  return(nights)
}


nights = list.nights(path)

# same thing for stations, but add depth of folder higherarchy for station from enclosing folder
list.stations = function(path,depth){
  
  # list files (only JPG to get rid of possible shorter path files)
  folders = data.frame(full.name = list.dirs(path = path,full.names = T,recursive = T))
  
  # count length of parent file path
  parent.depth = str_count(path,pattern = "/")
  
  # remove any paths that dont contain 'clipped'. This is slightly redundant most of the time as clipped files are jpg and raw files are png
  folders = filter(folders,grepl("clipped",full.name))
  folders.chk = filter(folders,str_count(full.name,pattern = "/") == parent.depth+depth)
  
  # get night names
  files$night.path = dirname(files$full.name)
  
  
  # keep only night names
  nights = data.frame(full.path = unique(files$night.path))
  
  # get station IDs and night IDs for this
  nights$night = basename(nights$full.path)
  nights$station = basename(dirname(nights$full.path))
  nights$transect = basename(dirname(dirname(dirname(nights$full.path))))
  
  return(nights)
}



# save
write.csv(nights,file = "D:/PMRA_SAR/processing/Timelapse_files/RTS/BIRD/2022/MKVI/MKVI-22/process_tracking.csv",row.names = F)







# FUnction for listing RTS files

list.rts = function(path){
  
  # list files (only JPG to get rid of possible shorter path files)
  files = data.frame(full.name = (list.files(path = path,pattern = ".jpg",all.files = T,full.names = T,recursive = T)))
  
  # remove any paths that dont contain 'clipped'. This is slightly redundant most of the time as clipped files are jpg and raw files are png
  files = filter(files,grepl("clipped",full.name))
  
  
  
  
  
  
  
  
  
  
}


