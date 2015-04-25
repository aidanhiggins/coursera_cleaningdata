---
title: "Test & Train Activity Data Averages"
author: "Aidan Higgins"
date: "2015/04/25"
output:
  html_document:
    keep_md: yes
---
 
## Project Description
This project contains a single R script that loads both test and training data, merges it, groups it by activity and finally calculates the mean of each group before writing to an output file. It was completed as part of a project for the Coursera course 'Getting and Cleaning Data'.
 
##Study design and data processing
 
###Collection of the raw data
The data was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and extracted to the same directory as the script is run from.
 
###Notes on the original (raw) data 
A full description of the data is available from here: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".
In summary it contains:
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The actual dataset is described in detail in the 'features_info.txt' file that is included with the dataset.

##Creating the tidy datafile
 
###Guide to create the tidy data file
1. Download the 'getdata-projectfiles-UCI HAR Dataset.zip' file and extract it.
2. Navigate to the 'UCI HAR Dataset' directory and run the 'run_analysis.R' script from this location.
 
###Cleaning of the data
The script 'run_analysis.R' does the following:

10. Extract the names of the columns required


A data.frame containing the data from the file './test/X_test.txt'
A data.frame containing the data from the file './test/y_test.txt'
A data.frame containing data from the file './test/subject_test.txt'
A data.frame containing the data from the file './train/X_train.txt'
A data.frame containing the data from the file './train/y_train.txt'
A data.frame containing the data from the file './train/subject_train.txt'
A character array containing the headers for the activity and subject data files: 'activity','subject'
A data.frame containing the data from the file './features.txt'
A character array containing all of the header data from the 'subject_headers' variable. 
A new character array containing both the 'y.subject.headers' data and the 'subject_headers' data
### valid_column_names
A character array created from the 'data.headers' variable to ensure all of the data.headers are unique
A data.frame containing a merge of the y_test_file and subject_test_file datasets
A data.frame containing a merge of the y_train_file and subject_train_file datasets
A data.frame containing a merge of the test_act_subj and x_test_file datasets
A data.frame containing a merge of the train_act_subj and x_train_file datasets
A data.frame containing a merge of the test (test_file_input) and training (train_file_input) data
A character array containing an array of the of the columns required for output, based on a grep using the regular expression: 'activity|subject|\\.mean\\.|\\.std\\.'
A data.frame containing all of the columns required from the all_input_data dataset
A data.frame containing the data from the file './activity_labels.txt'
A factor array containing all of the data from the column data_mean_std$activity, replaced by the name from 'activities'
### data_mean_std_tbl
A data.table version of the data_mean_std variable
A data.table containing the averages of all of the columns in data_mean_std_tbl, grouped by activity and subject