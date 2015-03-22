# CleaningData
This repository is for the coursera course "Getting and Cleaning Data

The dataset is Human Activity Recognition Using Smartphones Dataset Version 1.0. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Current project aims to realize following goals:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
After getting a tidy data set, output a table with the average of each variable for each activity and each subject. 


In current script, I first labeled each variable in test and training data sets, and then select the columns of mean and standard deviation for each measurement. Mean Frequency in the data set is not included. Then I labeled each activity and subject accordingly. Lastly, I generated the summary table with the average of each variable for each activity and each subject. 
Comments are also included in the R script for easy understanding. 