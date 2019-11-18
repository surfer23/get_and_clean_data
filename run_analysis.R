# Load the required packages


#Download the required data set and unzip
dir <- "UCI HAR Dataset"

if (!file.exists(dir)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dest_file <- "data.zip"
  download.file(url, destfile = dest_file, method = "curl")
  unzip(dest_file)
}


# Merges the training and the test sets to create one data set.

