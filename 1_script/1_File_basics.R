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
recs.loc = "F:/"
 
# List files in location
files = list.files(path = recs.loc,all.files = T,full.names = T,recursive = T)
file.frame = data.frame(files)

# ID by enclosing folder 
list.dirs(path=recs.loc,recursive = F)



