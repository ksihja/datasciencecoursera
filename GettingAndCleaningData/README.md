# Getting and Cleaning Data course assignment

This directory contains files and R script to accomplish Coursera's "Getting and Cleaning Data" assignment. 

Files are as below:

##tidyDataSet.txt 
Tidy data set that is the outcome of assignment. For browsing produced data set follow steps below ([credits for David Hood for his instructions)](https://thoughtfulbloke.wordpress.com/2015/09/09/):
* [download tidyDataSet.txt](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/tidyDataSet.txt) file from my github account into working directory of your R session
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

###Explanation of processing steps in run_analysis

Processing steps in run_analysis() script itself contains more detailed information connected to each of the steps below:

* First step in script is to download [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (HARUS for short later in text). Downloading is made over http since that seems to work too and we can thus avoid some of the [problems specific for the computers OS] (http://rpubs.com/thoughtfulbloke/downloadtips).

* Process data according to Step 1 in assignment ("Merges the training and the test sets to create one data set"): 

Read all files that are needed for this step.  

Files needed are UCI HAR Dataset/train/X_train.txt,  UCI HAR Dataset/train/y_train.txt,  UCI HAR Dataset/train/subject_train.txt,  UCI HAR Dataset/test/X_test.txt,  UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/test/subject_test.txt. During reading of training files colums are named as below:

subject_train.txt -> data read into column "subjectid"

y_train.txt -> data read into colum "activityid"

X_train.txt -> data read as fixed width file but no colums are named during reading.

Similar column naming is used also files in test set.

Training files containing subject ids (column name "subjectid"), activity ids ("activityid") and measures of feature vectors are then combined into one data frame. Every training data file has 7352 rows so these can be attached together with cbind(). 

As a result we get a data frame with 7352 rows and 563 columns. Columns are like: "subjectid", "activityid" followed by 561 feature columns without programmatically defined name.

Files in test set has 2947 rows so these are also combined with cbind(). Columns are similar than in combined training set.

Lastly combined training data and test data are attached together by adding combined test data after combined training data row by row (using rbind() ). As a result we get data frame with 10299 rows and  563 columns.

* Step 2 ("Extracts only the measurements on the mean and standard deviation for each measurement"): 

To be able to decide which feature measurements are mean or standard deviation type we need to have names for features. These are found in file UCI HAR Dataset/features.txt. This file contais 561 rows (one for each feature) and each row has two values: numeric column index referring a column in feature measurent file (UCI HAR Dataset/train/X_train.txt and UCI HAR Dataset/test/X_test.txt) and textual feature name matching to that column. During reading these 2 colums are named as "featureid" and "featurename".

When feature names are read into data frame we are using grep and regular expression to find out all feature names containing string 'std()' or 'mean()' somewhere in the feature name. Set of feature names found with this logic is measurements that is requested in step 2. Grep command returns indexes of features whose name matches to regular expression filter. 

**NOTE** *Additional vectors (see UCI HAR Dataset/features_info.txt for gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean and tBodyGyroJerkMean) are intentionally left out (regular expression discards these since they dont have '()' after feature name). Decision to leave these vectors out is based on interpretation of information in features_info.txt and features.txt where it can be seen that these additional vectors are present only in last 7 features as a parameter for angle() feature. They are thus not measurements __but parameters of measurement__. Similarly features having meanFreq() in their name is also left out since features_info.txt clearly gives this feature different meaning than plain mean() value calculation.*

After calculating indexes for requested features we create new data frame subsetting the data frame created in Step 1 with calculated index positions of requested features.

As a result we get data frame with 10299 rows and 68 columns. Columns are like: "subjectid", "activityid" followed by 66 filtered feature columns without programmatically defined name.

* Step 3 ("Uses descriptive activity names to name the activities in the data set"):

Activity labels are first read into R from UCI HAR Dataset/activity_labels.txt. During reading 2 columns in activity_labels.txt file are named as "activityid" and "activityname".  

Data frame created in step 2 is then mutated by adding new column "activityname" as a last column in data frame. Value for activity name can be deduced by matching value of "activityid" column from activity_labels.txt with value of "activityid" in data frame from step 2.

Further ordering of resulted data frame is made by moving added "activityname" column from last position to second position right after first "subjectid" column. This is made for making it easier to see in quick glance that mutated column indeed is added in data frame. 

As a result we get data frame with 10299 rows and 69 columns. Columns are like: "subjectid", "activityname", "activityid" followed by 66 filtered feature columns without programmatically defined name.

* Step 4 ("Appropriately labels the data set with descriptive variable names"):

Data frame still have no descriptive names for 66 feature colums. 

We reuse first feature names that we read into R in step 2. We filter feature names using same regular expression than in step 2 but now we instruct grep to return feature names instead of index (that was used in step 2).

After receiving vector of names for filtered features we beautify these names a little further. All '-', '(' and ')' characters are removed from feature names to make them contain only alphabetical characters. Capital letters are not removed from feature names since they are quit long names already and more readable for human eys with capital letters left even though further R-processing is easier with lower case letters only. Conversion to lower case is trivial with tolower() function if needed.

Next "t" into beginning of feature name is replaced with string "timedomain" and "f" in the beginning with string "frequencydomain". This modification is made so that feature names "tBodyAccmeanX" and "fBodyAccmeanX" (which are after modification "timedomainBodyAccmeanX" and "frequencydomainBodyAccmeanX") are more distinguished. Further "t" or "f" is pretty meaningless without explanation. 

Basically you could still modify feature names more (convert "Acc" to "Accelometer", "Mag" to "Magnitude" etc.) but I feel that opening all abbreviations from feature names is an overkill since it leads so long names that they are almost unreadable. See [CodeBook](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/CodeBook.md) for more detailed explanations concerning different abbreviations within feature names and their meaning.

As a last step modified feature names are inserted into data frames names()  after first 3 columns.

As a result we get data frame with 10299 rows and 69 columns. Columns are like: "subjectid", "activityname", "activityid" followed by 66 filtered feature columns where naming is now descriptive (i.e feature column with name "V1" is changed to "timedomainBodyAccmeanX" and so on).

* Step 5 ("From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject):

Processing in this step is closely connected to [Tidy data article](http://vita.had.co.nz/papers/tidy-data.pdf) mentioned already earlier. In a nutshell tidy data principles are as below:

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

For principle 3. we don't need to do anything. We already have one data frame containing observations of only one type: calculated feature vectors per subject and activity.

For principle 2. We are observing (calculating) mean values for feature vectors for each combination of subject and activity. Subject and activity are specified by columns "subjectid" and "activityname". When we first split (or group) our data set based on these two variables to obtain all combination of these 2 variables and then calculate mean values of all 66 features over specific (subjectid, activityname)  combination we reach the tidy data goal by having one observation per row. 

This observation is of form: subjectid, activityname and 66 columns containing mean value for each feature vector per this (subjectid, activityname) combination. Mean value for activityid column (column 3) is also calculated but that column is not part of tidy data and is removed in later phase (see below).

We have 30 subjects and 6 activities so we end up by having 180 different combination of (subjectid, activityname) combinations. These will define the number of rows (observations) in our tidy data set.

We still need to tackle principle 1. We have in our data frame now columns "activityname" and "activityid" which are connected to the same underlying variable (activity). We get rid of "activityid" column since we want to keep the one that contains descriptive names.

Resulting data set size is 180 rows x 68 columns.

As a last action we still modify column names for features so that they contain information that instead of features in data frame in step 4 columns now contain mean of feature vector. This is accomplished by adding a string "meanof" in the beginning of each of the 66 feature vector's mean value column.

Finally we remove temporary file containig HARUS data set zip file from local disk and write resulting tidy data set with name "tidyDataSet.txt" into R's working directory.

So our final tidy data set has 180 rows (number of observations) and 68 colums named: "subjectid", "activityname" and 66 descriptive feature vector names ("meanoftimedomainBodyAccmeanX", "meanoftimedomainBodyAccmeanY" ... ). 

To check all column names issue command `> names(tData)`

##README.md
(this file): Overview of all files in this directory
