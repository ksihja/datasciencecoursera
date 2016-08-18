# Getting and Cleaning Data course assignment

This directory contains files and R script to accomplish Coursera's "Getting and Cleaning Data" assignment. 

Files are as below:

tidyDataSet: Tidy data set that is the outcome of assignment. For browsing produced data set follow steps below ([credits for David Hood for his instructions)](https://thoughtfulbloke.wordpress.com/2015/09/09/):
* download tidyDataSet file into working directory of your R session
* load data set into R: 
`> tData <- read.table("tidyDataSet")`
* check data visually using for example View: `> View(tidyDataSet)`

CodeBook.md: Code book explaining study design, creation steps for tidy data and description of variables in final tidy data set.

README.md (this file): Overview of all files in this directory

run_analysis.R: R script used for getting and processing data. Analysis script is executed without any parameters ( `> run_analysis()` ) and it produces a tidy data set (for definition of what tidy data is see [Hadley Wickhams's "Tidy Data" article](http://vita.had.co.nz/papers/tidy-data.pdf)  
