##########################################################################################################
########### Get all required file information for future analysis and analysis tracking ##################
##########################################################################################################

## IMPORTANT ~ You will need to run this on all of the locations where your files are kept ##
## - If you have multiple hard drives, make sure you run this on all your hard drives. ##
## - If you keep the folder structure the same in each location this script will run easier

# Re-set  your script when needed
dev.off()
rm(list=ls())

# libraries
library(stringr)
library(tidyverse)
library(av)
#library(chron)
library(seewave)
library(lubridate)




#### Part 1 ~ Metadata and location extraction ####

## Step 1 - Location and listing

# Set folders where all files are kept
recs.loc = "S:/ProjectScratch/398-173.07/ARUs - 2022"
 
# List files in location
files = list.files(path = recs.loc,all.files = T,full.names = T,recursive = T)
file.frame = data.frame(files)

# ID by enclosing folder 
paths = data.frame(Full = list.dirs(path=recs.loc,full.names = T, recursive = F)) # list paths
paths$folder = basename(paths$Full) # get names of enclosing folders
paths$


# Now you can set your filters for path names based on what you care about and 'other'
paths.basic = c("copied_recordings","processing","recordings","Spectrograms")

i = 1
for (i in 1:nrow(paths)){
  if(paths$folder[i] %in% paths.basic){}
  
  
}

