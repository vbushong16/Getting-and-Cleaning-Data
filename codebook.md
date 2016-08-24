#Getting and Cleaning Data Course Project CodeBook
##=================================================
This file provide details on: the variables, the data and the transformations performed to generate a tidy data-set.  
* Website location of the dataset:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Zip folder containing the data:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* run_analysis process breakdown and explanation:   
 1- Build all te file paths to successfully load all subsequent txt files

 2- Read *activity_label.txt* into *row_values_activities* 2 columns: 
  - V1 (numeric):numeric value of activity
  - V2 (character): character value of activity
  
 3- features.txt into *col_values_feature* 2 columns: 
  - V1 (numeric):numeric value of feature
  - V2 (character): character value of feature
 
 4- Formatting of the character values in column V2 for col_values_activities and column  V2 for row_values_activities. 
  - activity names are made lowercase and removal of "_".
  - only features with mean() and std() selected, capitalization of "Mean" and "Std" and removal of "-" saved into *feature_labels*.
 
 5- Load in *subject_test.txt* into *individual_id_test*, *X_test* into *data_test* and *Y_test* into *row_id_test*.
  - individual_id_test: 1 column (V1) numeric: represents individuals id
  - data_test: 561 columns (V1-V561) dataset with values between -1 and 1 for different recorded values for test subjects
  - row_id_test: 1 column (V1) numeric: represent different activities
  
 6- Merge *row_values_activities* and *row_id_test* on the first column in *row_id_test* and second column of *row_values_activities*.
 
 7- Bind *activity_id*, *individual_id_test* and *data_test* column wise into *full_data_test* and rename the first 2 columns: Activity and Individual ID. dimensions:  2947X563
 
 8- Load in *subject_train.txt* into *individual_id_train*, *X_train* into *data_train8 and *Y_train* into *row_id_train*.
  - individual_id_train: 1 column (V1) numeric: represents individuals id
  - data_train: 561 columns (V1-V561) dataset with values between -1 and 1 for different recorded values for train subjects
  - row_id_train: 1 column (V1) numeric: represent different activities
 
 9- Merge *row_values_activities* and *row_id_train* on the first column in *row_id_train* and second column of *row_values_activities*.
 
 10- Bind *activity_id*, *individual_id_train* and *data_train* column wise into *full_data_train* and rename the first 2 columns: Activity and Individual ID. dimensions:  7352X563
 
 11- Combine the *full_data_train* and *full_data_test* row wise into *full_data* to get a data frame 10299X563.

 12- Subset *full_data* to select features only about the mean and std calculations. 10299X68
  - full_data: 68 columns:
    - Column 1: "Activity" contains character values for the 6 different kind of activity.
    - Column 2: "Individual ID contains integer values ranging from 1 to 30 that distinguish each individual who was studied.
    - The other 66 columns contain mean and std measurements for different factors recorded in the test that range from -1 to 1.  
 
 13- Generate a tidy data-set recording the average of each measurement by activity for each individual. There are 30 subjects and 6 different activities, this gives us a 180X68 data frame.
 
 14- Write the full data-set out to "full data-set.txt". This file is saved into the UCI HAR Dataset folder. 

 15- Write the tidy data-set out to "tidy data-set.txt". This file is saved into the UCI HAR Dataset folder.    
