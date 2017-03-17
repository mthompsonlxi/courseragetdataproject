# Coursera: Getting and Cleaning Data - Course Project

This repository contains my submission for the course project in the Coursera: Getting and Cleaning Data Project.

## Contents
The four files in this repository contain all the necessary information to understand how the UCI HAR Dataset was massaged

### README.md
This document

### CodeBook.md
This document contains information on the raw data used as well as what this data represents, this is an updated version from the original UCI HAR Dataset CodeBook

### run_Analysis.R
This script takes the training and test data sets and completes the following actions;

1. Imports the *features* file which contains the variable names for the training and test data sets
..1. Extracts the variables which are related to the mean and standard deviation only. This includes the column ID and the Variable Name
..2. Removes the components which do not add any value to the variable name
2. For each of the training and test data sets
..1. Imports the full data set (X)
..2. Imports the activity (Y) each row is related to
..3. Imports the subject (subject) each row is related to
..4. Combines this into one document for the test and training data sets
..5. Combines the data from the previous step into one large file
3. Cleans up the activity names to make them consistent and remove the underscores
4. Using the output data set from (2), applies the column / variable names
5. Transforms the subject and activity into factor variables
6. Loads the reshape2 library and does the following;
..1. Melts the dataset into a format which works well with dcast
..2. dcasts producing a mean for each variable by subject and activity
..3. Exports this as tidy.txt

### tidy.txt
The output from the *run_Analysis.R* script above