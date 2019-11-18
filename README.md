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