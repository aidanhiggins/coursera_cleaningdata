# coursera_cleaningdata
Used as part of the Coursera course 'Getting and Cleaning Data'

This repository contains a single R script 'run_analysis.R' that loads both test and train data (downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), merges it, groups it by activity and finally calculates the mean of each group before writing to an output file 'grpd_output.txt'. 
This script should complete the following:
1. Loads the training and test data sets
2. Merges the training and the test sets to create one data set
3. Extracts only the measurements on the mean and standard deviation for each measurement 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
7. Outputs this dataset to a file named 'grpd_output.txt' in the same location as the script

The codebook describes the flow and variables in more detail.
