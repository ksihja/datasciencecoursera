# Getting and Cleaning Data course assignment

This directory contains files and R script to accomplish Coursera's "Getting and Cleaning Data" assignment. 

Files are as below:

__tidyDataSet__: Tidy data set that is the outcome of assignment. For browsing produced data set follow steps below ([credits for David Hood for his instructions)](https://thoughtfulbloke.wordpress.com/2015/09/09/):
* download tidyDataSet file into working directory of your R session
* load data set into R: 
`> tData <- read.table("tidyDataSet")`
* check data visually using for example View: `> View(tidyDataSet)`

__CodeBook.md__: Code book explaining study design, creation steps for tidy data and description of variables in final tidy data set.

__README.md__ (this file): Overview of all files in this directory

run_analysis.R: R script used for getting and processing data. Analysis script is executed without any parameters ( `> run_analysis()` ) and it produces a tidy data set in the R working directory. 

For definition of what tidy data is see [Hadley Wickham's "Tidy Data" article](http://vita.had.co.nz/papers/tidy-data.pdf).  

Processing steps in run_analysis(), scrip itself contains more detailed information connected to each of the steps below:

1. Download [Human Activity Recognition Using Smartphones Data Set (a zip file)]("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") (HARUS for short later in text).
2. Read in the R all files that are needed for Step 1 of assignment: "Merges the training and the test sets to create one data set" (UCI HAR Dataset//train/X_train.txt, train/y_train.txt, train/subject_train.txt, /test/X_test.txt, test/y_test.txt, test/subject_test.txt )

