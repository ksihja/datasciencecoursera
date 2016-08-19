# Getting and Cleaning Data course assignment

This directory contains files and R script to accomplish Coursera's "Getting and Cleaning Data" assignment. 

Files are as below:

__tidyDataSet__: Tidy data set that is the outcome of assignment. For browsing produced data set follow steps below ([credits for David Hood for his instructions)](https://thoughtfulbloke.wordpress.com/2015/09/09/):
* download tidyDataSet file into working directory of your R session
* load data set into R: 
`> tData <- read.table("tidyDataSet")`
* check data visually using for example View: `> View(tidyDataSet)`

__CodeBook.md__: Code book explaining study design, creation steps for tidy data and description of variables in final tidy data set.

__run_analysis.R__: R script used for getting and processing data. Analysis script is executed without any parameters ( `> run_analysis()` ) and it produces a tidy data set in the R working directory. 

For definition of what tidy data is see [Hadley Wickham's "Tidy Data" article](http://vita.had.co.nz/papers/tidy-data.pdf).  

Processing steps in run_analysis(), scrip itself contains more detailed information connected to each of the steps below:

0. Download [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (HARUS for short later in text).
1. Read all files that are needed for Step 1 of assignment: "Merges the training and the test sets to create one data set" . Needed files in this step are UCI HAR Dataset/train/X_train.txt,  UCI HAR Dataset/train/y_train.txt,  UCI HAR Dataset/train/subject_train.txt,  UCI HAR Dataset/test/X_test.txt,  UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/test/subject_test.txt. Training files containing subject ids, activity ids and measuresof  featurevectors are then combined into one data.frame. Every training data file has 7352 rows so these can be attached together with cbind(). Files in test set has 2947 rows so these are also combined with cbind(). Lastly combined traing data and test data are attached together by adding combined test data after combine training data row by row. 

__README.md__ (this file): Overview of all files in this directory
