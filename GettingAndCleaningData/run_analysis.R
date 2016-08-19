
run_analysis <- function(){
    
    
    library(readr)
    library(dplyr)
    
    # Download Human Activity Recognition Using Smartphones (HARUS for short) Data Set  (a zip file).
    # We download this file into temporay file created in local file system.
    
    humanActivityDataSetUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    # Create temporary file name for HARUS data set zip file and save data set zip into that name.
    tempFileForDataSet <- tempfile()
    download.file(humanActivityDataSetUrl,tempFileForDataSet)
    
    
    rootDirectoryInZipFile = "UCI HAR Dataset/"
    
    # ###########################################################################################
    #
    # STEP 1. Merges the training and the test sets to create one data set.
    #
    #############################################################################################
    
    # NOTE: Reading needed files into R: zip file is not extracted (unzipped) into file system. 
    # Required files are directly read from zip into R 
    # with unz function (unzipping made in memory on the fly).
    
    
    # 1A.) Reading trainig set train/X_train.txt. This file contains values for 561 features for 
    # those subjects who has been selected to be part of training set.
    # File is read into R with read_fwf since X_train.txt is fixed width file with 16 characters
    # per field.
    
    trainingDataFilePath = paste(rootDirectoryInZipFile, "/train/X_train.txt", sep ="")
    trainingData <- read_fwf(trainingDataFilePath, fwf_widths(as.vector(rep(16,561), "numeric"))) 

    
    # 1B.) Reading train/y_train.tx that contains activity labels connected to each row in training
    # set.
    
    activityLabelsForTrainingFilePath = paste(rootDirectoryInZipFile, "train/y_train.txt", sep ="")
    activityLabelsForTraining <- read.csv(activityLabelsForTrainingFilePath, stringsAsFactors = FALSE, 
                                           header = FALSE, col.names = c("activityid"))
    
    # 1C.) Reading train/subject_train.txt that identifies the subject who performed the
    # activity for each window sample.
    
    trainingSubjectFilePath = paste(rootDirectoryInZipFile, "train/subject_train.txt", sep ="")
    trainingSubject <- read.csv(trainingSubjectFilePath, stringsAsFactors = FALSE, 
                             header = FALSE, col.names = "subjectid")
    
    # 1D.) Combining trainingSubject, activityLabelsForTraining and trainingData into a one data 
    # frame. TrainingSubject will be first colum, trainingactivity second and 561 component feature vector 
    # is found after these 2 colums in combined data frame. All columns to be combined contains 
    # 7352 rows so they can be naturally added side-by-side as columns of combined data frame..
    
    combinedTrainingSet <- cbind(trainingSubject, activityLabelsForTraining, trainingData)
 

    # 1E.) We do similar operations to the test set data files (X_test.txt for test data, y_test.txt for
    # testing activity labels and subject_test.txt for subjects that performed activities in test set)
    # As a result we get combinedTestSet data analogously what has been made for training data above.
    
    testDataFilePath = paste(rootDirectoryInZipFile, "/test/X_test.txt", sep ="")
    testData <- read_fwf(testDataFilePath, fwf_widths(as.vector(rep(16,561), "numeric")))

    activityLabelsForTestFilePath = paste(rootDirectoryInZipFile, "test/y_test.txt", sep ="")
    activityLabelsForTest <- read.csv(activityLabelsForTestFilePath, stringsAsFactors = FALSE, 
                                          header = FALSE, col.names = c("activityid"))
 
    testSubjectFilePath = paste(rootDirectoryInZipFile, "test/subject_test.txt", sep ="")
    testSubject <- read.csv(testSubjectFilePath, stringsAsFactors = FALSE, 
                                header = FALSE, col.names = "subjectid")
    
    combinedTestSet <- cbind(testSubject, activityLabelsForTest, testData)
    
    
    #
    # 1C.) Combining training and test sets together.
    #
    
    combinedSet <- rbind(combinedTrainingSet, combinedTestSet)
    
    
    # ###########################################################################################
    #
    # STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    #
    #############################################################################################
    
    
    # 2.A.) Reading features.txt that contains names of 561 features. Data read from this file
    # is used to calculate indexes for std() and mean() in combined data set.
    #
    # Only those measurents are filtered into dataset whose names contains strings "std()" 
    # or "mean()" as described by features.txt file.  
    
    featureNamesFilePath = paste(rootDirectoryInZipFile, "features.txt", sep ="" )
    featureNames <- read.csv( featureNamesFilePath, stringsAsFactors = FALSE, 
                              header = FALSE, sep = " ", col.names=c("featureid", "featurename"))
  
    # Calculate index position for each of the std() and mean() measurement using feature names read from
    # features.txt. We add 2 in each calculated index since combinedSet which we are filtering contains
    # 2 extra columns in front of features columns (subjectid and activityId).
    
    indexesForStdAndMeanMeasuremensInDataSet <- grep("^.*mean\\(\\)|std\\(\\).*", featureNames$featurename) + 2
    
    # We want to include also subjectid and activityId colums in filtered result so we add indexes
    # 1 and 2 into set of filtered indexes.
    
    indexForFiltering <- c(c(1,2), indexesForStdAndMeanMeasuremensInDataSet)
    
    # Form filteredDataSet based on the calculated index positions
    
    filteredDataSet <- combinedSet[indexForFiltering]
    
    
    # ###########################################################################################
    #
    # STEP 3. Uses descriptive activity names to name the activities in the data set
    #
    #############################################################################################
    
    # Reading activity_labels.txt that contains textual representation for different activities.
    
    activityLabelsFilePath = paste(rootDirectoryInZipFile,"activity_labels.txt", sep ="" )
    activityLabels <- read.csv( activityLabelsFilePath, stringsAsFactors = FALSE, 
                                header=FALSE, sep = " ", col.names = c("activityid", "activityname"))
    
    # Add new column for activity name into data set
    activitiesConvertedInDataSet <- mutate(filteredDataSet, 
                            activityname = activityLabels[as.numeric(activityid), ]$activityname)
    
    # Reorder colums in data set so that activity name is second column after subject
    activitiesConvertedInDataSet <- activitiesConvertedInDataSet[c(1,69,2:68)]
    
    
    # ###########################################################################################
    #
    # STEP 4. Appropriately labels the data set with descriptive variable names.
    #
    #############################################################################################
    
    # Fetch column names for features using featureNames that was read from features.txt in step 2A.. 
    # We use second column since that contains textual name for feature and we also need 
    # to apply same grep than earlier when selecting appropriate std() and mean() measurement columns.
    
    descriptiveFeatureNames <- grep("^.*mean\\(\\)|std\\(\\).*", featureNames$featurename, value = TRUE)
    
    #
    # Make feature name more appropriate for futher processing by removing "-", ")" and "(" characters from 
    # feature's name.
    # New column name will be of form:
    # <modified feature name> where <modified feature name> is original feature name but "-", "("
    # and ")" characters are removed. 
    # Example: Column name "tBodyAcc-mean()-X" feature over subjectid and activityname group
    # will be "tBodyAccmeanX"
    
    descriptiveFeatureNames <- gsub("-","", descriptiveFeatureNames)
    descriptiveFeatureNames <- gsub("\\(", "", descriptiveFeatureNames)
    descriptiveFeatureNames <- gsub("\\)", "", descriptiveFeatureNames)
    
    # Replace t in the beginning with timedomain and f with frequencydomain
    descriptiveFeatureNames <- sub("^t", "timedomain", descriptiveFeatureNames)
    descriptiveFeatureNames <- sub("^f", "frequencydomain", descriptiveFeatureNames)
    
    # Create descriptive names for data set. 
    # Names are created as below:
    # columns 1 and 3: reuse existing names
    # colums 4-69: use feature names read from features.txt file for std() and mean() measurements
    # 
    names(activitiesConvertedInDataSet) <- c(names(activitiesConvertedInDataSet)[1:3], descriptiveFeatureNames)
    
    
    # ###########################################################################################
    #
    # STEP 5. From the data set in step 4, creates a second, independent tidy data set
    #         with the average of each variable for each activity and each subject.
    #
    #############################################################################################
    
    
    # Make dataset tidy (definition of tidy is taken from Hadley Wickham's "Tidy data" article ) 
    #
    # TD_1. Each variable forms a column.
    # TD_2. Each observation forms a row.
    # TD_3. Each type of observational unit forms a table.
    
    #  TD_3: Nothing to be done for this. Our data set contains only one type of observations:
    # those that are based mean values of features (observations) for each combination of subject and
    # activity.
    
    #
    # Below each processing step is expained and relation to processing step to achieve tidy data goals is shown. 
    # 
   
    # TD_2. Each observation forms a row:
    #
    # We are observing (calculating) mean values for feature vectors for each combination
    # of subject and activity. Subject and activity are specified by columns subjectid and activityname.
    #
    # When we first split our data set based on these two variables to obtain all combination of these 2
    # variables and then calculate mean values of all features over specific (subjectid, activityname) 
    # combination we reach the tidy data goal by having one observation per row. 
    #
    # This observation is of form:
    #
    # subjectid, activityname and 66 columns containing mean value for each feature vector 
    # per this (subjectid, activity) combination. Mean value for activityid column is also
    # calculated but that column is not part of tidy data and is removed in later phase (see below).
    #
    # Resulting data set size is 180 rows x 69 colums
    #
    # NOTE: summarise_each() applies given function to all columns of data frame except those used for grouping.
    # This offers handy way to calculate means of all features.
    #

    tidyDataSet <- activitiesConvertedInDataSet %>% group_by(subjectid, activityname) %>% summarise_each(funs(mean))

    
    # TD_1: Each variable forms a column. 
    # We have same variable (activity) in 2 colums now represented with id (column 3 activityid) and it's name
    # (column 2 activityname).
    # This is duplicate information for the same underlying variable and so we remove column activityid and leave 
    # column activityname that already has descriptive name and descriptive values.
    #
    # Resulting data set size is 180 rows x 68 columns
    
    tidyDataSet <- subset(tidyDataSet, select = -c(activityid))
    
    # Rename feature's mean value columns in summarized tidy data set to contain information that 
    # mean value was calculated over feature vector.
    #
    # New column name will be of form:
    # meanof(<feature name>)
    # Example: Column name for mean value of "tBodyAccmeanX" feature over subjectid and activityname group
    # will be "meanoftBodyAccmeanX"
    
    names(tidyDataSet) <- c( names(tidyDataSet[1:2]), sapply(names(tidyDataSet)[3:68], 
                                                    function(x){
                                                        newColName <- paste("meanof",x, sep ="")
                                                    }
                                            )
            )
    

    # Remove HARUS data set zip file created in the beginning of the script.
    
    unlink(tempFileForDataSet)
    
    # Save dataset into local disk under working directory
    
    write.table(tidyDataSet, file="./tidyDataSet.txt")
}
