# coursera-Getting-and-Cleaning-Data

###This repository contains the Getting and Cleaning data programming assignment from Coursera
###========================================


 - Guide to running run_analysis.R. 
 - Start by downloading the zipped data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 - Extract all the folders and copy the directory (up to the UCI HAR Dataset folder) into the dir variable in run_analysis.R
 - Make sure all necessary files are in the UCI HAR Dataset folder:
   - activity_label.txt
   - features.txt
   - test folder (make sure these folders have the data: subject_test.txt, X_test.txt and Y_test.txt)
   - train folder (make sure these folders have the data:subject_train.txt, X_train.txt and Y_train.txt) 
   - other README files with description
 - Now save run_analysis.R into your working directory and load it using source("run_analysis.R") command in RStudio. 
 - Once "Tidy data set created" is printed to the console, you will find in the UCI HAR Dataset folder:
   - full data-set.txt : this file is 10299*68 dataframe with the the features about mean and std for each individual and activity.
   - tidy data-set.txt : this file is 180*68 dataframe with the averages of features for each activity for each individual.
 - To view the tidy data-set.txt data simply call the object "data" in the console. Or View(data) to open a view of the data
 


### End of run_analysis process instructions
