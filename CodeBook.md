# CodeBook for the Coursera Getting and Cleaning Data Project output (tidy.txt)

## Background

The **Human Activity Recognition Using Smartphones Data Set** is a set of data derived from Samsung smart phones which recorded data on 30 subjects in a given age bracket performing a variety of activities. Further details of the study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## This Data

The interest in this data is the derived means for each of the provided mean() and std() value for each subject by activity.

### Subject

This is an anonymised value for the subject, bounded between 1 and 30

### ActivityName

This is the activity that was performed that the mean refers to;

* walking
* walkingupstairs
* walkingdownstairs
* sitting
* standing
* laying

### Variables

This is a set of 66 variables which the mean values of all the observations for subject by activity is provided for. These can be translated as below (taken directly from *features_info.txt* of the dataset);

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag