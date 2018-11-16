###Code Book
##Description of the set of functions and variables used for the course project in Getting and Cleaning Data

##Resource
#Information site
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Dataset arhive
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#Addition about experiments
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Description methods
dplyr library was used to perform the task. 
Data is loaded from raw files. Then, for better understanding, the numeric columns are replaced with the names from the descriptive file features.txt.
All downloaded data is summarized in a common set. Selected data containing values of mean or std. Then a stack of data was collected from which we obtained average values for each subject and experiment.
The resulting final data set is saved for usability in txt and csv formats.

#Variables
X_test - X_test.txt source file data
Y_test - Y_test.txt source file data
subject_test - subject_test.txt source file data
X_train - X_train.txt source file data
Y_train - Y_train.txt source file data
subject_train - subject_train.txt source file data
features - features.txt source file data
activity_labels - activity_labels.txt source file data
merge - Single complete data set
merge2 - Single data set with selected columns of mean and std
data - Formed stack of selected data
dataout - Final clean data set
