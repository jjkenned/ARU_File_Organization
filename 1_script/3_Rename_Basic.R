###########################################
### rename Bird recordings in storage ##### 
###########################################

# Re-set  your script when needed
dev.off()
rm(list=ls())

# Get your functions
source("S:/ProjectScratch/398-173.07/PMRA_WESOke/PMRA_SAR/Script/Functions/Update_Prefix_Name_Bird.R")

# list files to rename
file.loc = "D:/PMRA_SAR"


####### STOP ~~~ ######

##### Decide if you want to run part 1 or 2 ####



####### Part 1 ~ audio files (wav by default) #######

# list files that match pattern (wav)
files = data.frame(orig.full = list.files(file.loc,recursive = T,full.names = T))


files$basename = basename(files$orig.full)

# new station
files$new.station = basename(dirname(files$orig.full))

files$old.station = substr(files$basename,1,12)

for (i in 1:nrow(files)){
  
  files$new.full[i] = gsub(files$old.station[i],files$new.station[i],files$orig.full[i])
  
  
  
}


for (i in 1:nrow(files)){
  
  
  file.rename(from = files$orig.full[i],to = files$new.full[i])
  
  }










































