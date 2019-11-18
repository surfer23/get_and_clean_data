# Load the required libraries
library(stringr)
library(dplyr)
library(tidyr)
library(data.table)

#Download the required data set and unzip
dir <- "UCI HAR Dataset"

#Functions

#Bind activity and subject columns to the dataset
add_sub_act <- function(group,ds){
  
  #Add activity column
  act_desc <- read.table(paste0(dir,"//activity_labels.txt"), header = FALSE, sep = "")
  act_column <- read.table(paste0(dir,"//",group,"//y_",group,".txt"), header = FALSE, sep = "")
  print(str(act_column))
  merge_column <- merge(act_desc, act_column, all.x=TRUE)
  print(str(merge_column))
  ds <- cbind("Activity" = merge_column$V2, ds)
  
  #Add subject column
  sub_column <- read.table(paste0(dir,"//",group,"//subject_",group,".txt"), header = FALSE, sep = "")
  ds <- cbind("Subject" = sub_column$V1, ds)
  ds <- ds[!duplicated(as.list(ds))]
  ds_final <- select(ds,  one_of ("Subject", "Activity"), matches("mean|std"))  
  ds_final
  
}


#Restructure coulmn names to make them more readable then assign them to the dataset in question
assign_col_names <- function(group){

  #Restructure the coulmn names
  features <- read.table(paste0(dir,"//features.txt"), header = FALSE, sep = "")
  columnNames = features$V2
  columnNames <- str_replace_all(columnNames, "-", "_")
  columnNames <- gsub("[][!#$%()*,.:;<=>@^`|~.{}]", "", columnNames)
  
  #Assign the restructered headers to the dataset
  ds = read.table(paste0(dir,"//",group,"//x_",group,".txt"), header=FALSE)
  names(ds) <- c(columnNames)
  
  #excute the function that adds the subjects and activities to the dataset
  add_sub_act(group, ds)
  }



#Download the required data set and unzip

if (!file.exists(dir)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dest_file <- "data.zip"
  download.file(url, destfile = dest_file, method = "curl")
  unzip(dest_file)
}


#Start the execution of data processing the train and test datasets
test_data <- assign_col_names("test")
train_data <- assign_col_names("train")


#Merges the training and the test sets to create one data set and outputs it as a file called merged_tidy_data.csv.

merged_dataset <- rbind(test_data,train_data)
fwrite(merged_dataset, "merged_tidy_data.csv")

#Outputs the mean values for each variable for each activity carried out by each Subject and outputs the result to a file called mean_tidy_data.csv
fwrite(merged_dataset %>% group_by(.dots=c("Subject","Activity")) %>% summarise_each(funs(mean)), "mean_tidy_data.csv")