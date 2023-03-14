############################################################
########### Summarize recording schedules ##################
############################################################


# Re-set  your script when needed
dev.off()
rm(list=ls())

# libraries
library(stringr)
library(tidyverse)
library(av)
library(seewave)
library(lubridate)
library(sound)



#### Part 1 ~ Metadata and location extraction ####

## Step 1 - Location and listing

# Set folders where all files are kept
recs.loc = "S:/ProjectScratch/398-173.07/ARUs - 2022"

# List files in location
files = data.frame(Full_name = list.files(path = recs.loc,all.files = T,full.names = T,recursive = T, pattern = ".wav"))

# Get Meta data 
meta = songmeter(basename(files$Full_name)) 
meta$recording = basename(files$Full_name) # append recording name
meta$full_name = files$Full_name # append full file path


# Get ordinal date
orday = yday(as.Date(paste0(file.grps$year[i],"-",file.grps$month[i],"-",file.grps$day[i])))



# Summarize by nights, volume of data and locations
file.grps = meta %>% group_by(prefix,year,month,day) %>% mutate(group_id = cur_group_id()) # group by date
# quick function for translating day number into night number 
# day = night ID, hr = hour in 24 hr clock (as integer), split = when to cut off the nights from one another (usually 12...noon)
d2n.func = function(day,hr,split){
  
  if (hr<split){night = day} else (night = day+1)
  
  return(night)
  
}





# apply function accross the dataframe 
file.grps$night.ID = mapply(d2n.func,file.grps$group_id,file.grps$hour,12) 




plot(file.grps$group_id,file.grps$night.ID) # visualize to make sure it makes sense

# Make new name column for renaming
# you will need to remove some things before processing anyway if this is an SM3 set of recordings 

# you will need to make another time ID
# to deal with timezone and time change issues let's just fucking convert to seconds
# you may need to fiddle with a single year

# years since
file.grps$sec_order=NA
for (i in 1:nrow(file.grps)){
  
  orday = yday(as.Date(paste0(file.grps$year[i],"-",file.grps$month[i],"-",file.grps$day[i])))
  secs = (86400*orday) + file.grps$sec[i] + (file.grps$min[i]*60) +(file.grps$hour[i]*60*60)
  file.grps$sec_order[i] = secs
  
  
}


plot(file.grps$sec_order,file.grps$time)





## spare manipulation script
# Change name of files if innacturate


files$base = basename(files$Full_name)
files$new_full = gsub("SE-09__0__","SE-09_0_",files$Full_name)

files.change = files[substr(files$base,1,5) == "SE-09",]

for (i in 1:nrow(files.change)){
  
  file.rename(files.change$Full_name[i],files.change$new_full[i])
  
  
}
