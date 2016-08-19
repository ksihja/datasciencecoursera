# Getting and Cleaning Data course assignment

This directory contains files and R script to accomplish Coursera's "Getting and Cleaning Data" assignment. 

Files are as below:

##tidyDataSet.txt 
Tidy data set that is the outcome of assignment. For browsing produced data set follow steps below ([credits for David Hood for his instructions)](https://thoughtfulbloke.wordpress.com/2015/09/09/):
* download tidyDataSet file into working directory of your R session
* load data set into R: 
`> tData <- read.table("tidyDataSet.txt")`
* check data visually using for example View: `> View(tData)`

##CodeBook.md
Code book explaining study design, creation steps for tidy data and description of variables in final tidy data set.

##run_analysis.R 
R script used for getting and processing data. 
Analysis script is executed without any parameters ( `> run_analysis()` ) and it produces a tidy data set in the R working directory according to the requirements stated in Assignment. 

**NOTE** __*run_analysis.R follows steps that are defined in assignment exactly. For example in step 2 it would have been very simple process to name selected feature vectors with descriptive names but this was not done in this step since assignment requests this operation to be made in Step 4.*__

For definition of what tidy data is see [Hadley Wickham's "Tidy Data" article](http://vita.had.co.nz/papers/tidy-data.pdf).  

Processing steps in run_analysis() script itself contains more detailed information connected to each of the steps below:

* Download [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (HARUS for short later in text).

* Step 1 ("Merges the training and the test sets to create one data set"): 

Read all files that are needed for this step.  
Files needed are UCI HAR Dataset/train/X_train.txt,  UCI HAR Dataset/train/y_train.txt,  UCI HAR Dataset/train/subject_train.txt,  UCI HAR Dataset/test/X_test.txt,  UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/test/subject_test.txt. 

Training files containing subject ids, activity ids and measures of feature vectors are then combined into one data.frame. Every training data file has 7352 rows so these can be attached together with cbind(). 

Files in test set has 2947 rows so these are also combined with cbind(). 

Lastly combined traing data and test data are attached together by adding combined test data after combined training data row by row. 

* Step 2 ("Extracts only the measurements on the mean and standard deviation for each measurement"): 

To be able to decide which feature measurements are mean or standard deviation type we need to have names for features. These are found in file UCI HAR Dataset/features.txt. This file contais 561 rows (one for each feature) and each row has two values: numeric column index referring a column in feature measurent file (UCI HAR Dataset/train/X_train.txt and UCI HAR Dataset/test/X_test.txt) and textual feature name matching to that column. 

When feature names are read into data.frame we are using grep and regular expression to find out all feature names containing string 'std()' or 'mean()' somewhere in the feature name. Set of feature names found with this logic is measurements that is requested in step 2. Grep command returns indexes of features whose name matches to regular expression filter. 

**NOTE** *Additional vectors (see UCI HAR Dataset/features_info.txt for gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean and tBodyGyroJerkMean) are intentionally left out (regular expression discards these since they dont have '()' after feature name). Decision to leave these vectors out is based on interpretation of information in features_info.txt and features.txt where it can be seen that these additional vectors are present only in last 7 features as a parameter for angle() feature. Similarly features having meanFreq() in their name is also left out since features_info.txt clearly gives this features different meaning than plain mean() value calculation.*

After calculating indexes for requested features we create new data frame subsetting the data frame created in Step 1 with calculated index positions of requested features.

##README.md
(this file): Overview of all files in this directory
