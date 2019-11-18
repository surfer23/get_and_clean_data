# Code Book Intoduction
The following code book documents the process for dealing with the tasks set in the *Getting and Cleaning Data Course Project*:

* You should create one R script called run_analysis.R that does the following.
    + Merges the training and the test sets to create one data set.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names.
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


* This code book describes the following:
    + the initial data structure and its variables,
    + the final data structure and its variables,
    + the overall process for cleaning the data into two tidy datasets:
      + [Merged tidy data set of variables that contain means and standard deviations](https://github.com/surfer23/get_and_clean_data/blob/master/merged_tidy_data.csv)
      + [Independent data set of averages for each variable grouped by the subject and the activity carried out by the subject](https://github.com/surfer23/get_and_clean_data/blob/master/mean_tidy_data.csv)

## Data source: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

  * [Data Set Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  * [Data Files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Experiment Background: Human Activity Recognition Using Smartphones
The experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the research team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

Files included in the dataset:

* *'README.txt'*

* *'features_info.txt': Shows information about the variables used on the feature vector.*

* *'features.txt': List of all features.*

* *'activity_labels.txt': Links the class labels with their activity name.*

* *'train/X_train.txt': Training set.*

* *'train/y_train.txt': Training labels.*

* *'test/X_test.txt': Test set.*

* *'test/y_test.txt': Test labels.*


### Transformations


#### 1. Descriptive activity names were added

  Integers corrosponding to an activity were replaced with the text name of the activity in the merged dataset.


#### 2. Column headers were added as descriptive variable names 

  *Original Variable Name -> New Variable Name*

    * tBodyAcc-mean()-X   -> tBodyAcc_mean_X
    * tBodyAcc-mean()-Y   -> tBodyAcc_mean_Y
    * tBodyAcc-mean()-Z   -> tBodyAcc_mean_Z
    * ...

#### 3. Extracted data where the varibales were either a mean or a standard deviation

#### 4. Merged the test and train datasets

#### 4. Extracted the means of the variables grouped by the Subject and the Activity they carried out