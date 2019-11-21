# Getting and Cleaning Data Course Project

## Purpose of the project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Introduction:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

## Datasets: 
The datasets used in this project are available at the site where the data was obtained.

### Source and Dataset Description

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Dataset files:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Repository structure:
* Script: run_analysis.R that does the following:
  + Merges the training and the test sets to create one data set.
  + Extracts only the measurements on the mean and standard deviation for each measurement.
  + Uses descriptive activity names to name the activities in the data set
  + Appropriately labels the data set with descriptive variable names.
  + Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
## Processing and cleaning data steps:

##### 1. Adding variable headers to each column using the features.txt file

```
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
```
##### 2. Adding the Subjects and Activities Data to the Dataset using the activity_labels.txt and y_"group".txt files. Then only extracting the variables with the mean and standard deviation
```
#Bind activity and subject columns to the dataset
add_sub_act <- function(group,ds){
  
  #Add activity column
  act_desc <- read.table(paste0(dir,"//activity_labels.txt"), header = FALSE, sep = "")
  act_column <- read.table(paste0(dir,"//",group,"//y_",group,".txt"), header = FALSE, sep = "")
  act_joined <- full_join(x = act_column, y = act_desc, by = "V1")
  ds <- cbind("Activity" = act_joined$V2, ds)
  
  #Add subject column
  sub_column <- read.table(paste0(dir,"//",group,"//subject_",group,".txt"), header = FALSE, sep = "")
  ds <- cbind("Subject" = sub_column$V1, ds)
  ds <- ds[!duplicated(as.list(ds))]
  ds_final <- select(ds,  one_of ("Subject", "Activity"), matches("mean|std"))
  ds_final
  
}

```

##### 3. Merging the two datasets and outputing the first tidy dataset merged_tidy_data.csv
```
#Merges the training and the test sets to create one data set and outputs it as a file called merged_tidy_data.csv & .txt.

merged_dataset <- rbind(test_data,train_data)
merged_dataset$Activity <- as.factor(merged_dataset$Activity)
merged_dataset$Subject <- as.factor(merged_dataset$Subject)

fwrite(merged_dataset, "merged_tidy_data.csv")
write.table(data,"merged_tidy_data.txt",row.names=FALSE)

```


##### 4. Outputting the mean of each variable for the activities carried out by each participant 
```
#Outputs the mean values for each variable for each activity carried out by each Subject and outputs the result to a file called mean_tidy_data.csv
fwrite(merged_dataset %>% group_by(.dots=c("Subject","Activity")) %>% summarise_each(funs(mean)), "tidy_data.csv")
write.table(merged_dataset %>% group_by(.dots=c("Subject","Activity")) %>% summarise_each(funs(mean)),"tidy_data.txt",row.names=FALSE)
```