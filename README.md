# Assigment 4: Smartphone Movement Summary

## Course: Getting and Cleaning Data 

## Assignment: Programming Assignment 4

## Purpose: 
Summarize the data captured by a Smartphone per subject/activity, where a subject is a person and an activity is one of the following:

1.  WALKING
2.  WALKING_UPSTAIRS
3.  WALKING_DOWNSTAIRS
4.  SITTING
5.  STANDING
6.  LAYING

**Output dataset description and how they were calculated can be found in the CodeBook.md file here:
https://github.com/chiuy1003/Assign4SmartphoneMovementSummary/blob/master/CodeBook.md**

## Instructions:

1.  Download data from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.  Extract the .zip file to your R working directory. You should have a directory named UCI HAR Dataset
3.  Download the run_analysis.R from this repo to your R working directory
4.  Execute the script and it will output summaryOfMeanAndStdSmartphoneData.txt to the R working directory

## run_analysis.R Details:

1.  Combines the test and train datasets along with the corresponding activity and subject IDs for each measurement
2.  Trim measurements to only include values that are mean and std (standard deviation)
3.  Summarizes the data so that it reports one row per subject/activity. It will take the mean of all measurements of a subject doing an activity
4.  Cleans up the column headers to be proper names
5.  Outputs data to an output file.

