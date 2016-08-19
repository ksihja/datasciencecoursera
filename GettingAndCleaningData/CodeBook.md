
## Project Description
Aim of this project was to prepare tidy data set from [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) (HARUS for short now on). For short HARUS was created by observing smart phones's accelerometer and gyroscope recordings when 30 volunteers were performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. 

Tidy data set should contain mean value observations of sub set of measurements offered by HARUS data. Filtering of measurement's from original data is based on whether measurement is mean or standard deviation type of measurement.

From this filtered set of measurement mean value of each measurement is then calculated per observation. Observation is a combination of person and an activity he/she is performing.

More detailed explanation of files and processing steps made during this project can be found from [README](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/README.md).

##Study design and data processing

###Collection of the raw data

For the scope of this project raw data means [HARUS data set zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Raw data was collected as a part of R-processing downloading it into R. 

###Notes on the original (raw) data 
HARUS data contains more detailed description of [its goals](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). 

Before starting actual processing raw data was checked against possible NA values in data. Since none was found there is no need to have any NA handling in actual R processing.

##Creating the tidy datafile

###Guide to create the tidy data file

Steps for creating tidy data set were based on the processing steps defined in assigment. In a high level following steps were made to prepare tidy data set5:

* raw data was downloaded into local disc
* training and test data were combined together to form one data set containing all 30 person's data
* Mean and standard deviation type of measurements (features) were selected from 561 original measurements
* New tidy data set was formed from combined data. Tidy data set's observation were 180 possible combinations of test person (a.k.a subject) and activity he/she was doing. Mean value of each of the filtered features was then calculated per each (subject,activity) combination
* As a result was a tidy data set with 180 rows and 68 colums was created.

For more details see 
[README](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/README.md).

###Cleaning of the data

There were no need for NA value handling since none were found. Cleaning of the data thus contained only filtering out unneeded portions of raw data. [README](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/README.md) contains detailed explanation explaining which parts ofr the data was discarded, in which phase of processing and why.

##Description of the variables in the tidyDataSet.txt file
 
 **NOTE**: *For checking tidy data set characteristic's with R commands given below you need to download [tidy data set](https://github.com/ksihja/datasciencecoursera/blob/master/GettingAndCleaningData/tidyDataSet.txt) into your local disc in R's working directory and issue following command `> tData <- read.table("tidyDataSet.txt")`*
 
 - Dimensions of the resulted tidy dat set was 180 rows x 68 colums. 180 represents number of observations (30 persons doing 6 different activities). First column is "subjectid", second is "activityname" and rest of the 66 columns are mean values of selected features over each observation. See dimensions by command `> dim(tData)tData`
 - For summarizing the data use commands `> head(tData)` and `>str(tData)`
 - Names of the variables in data set can be seen by issuing command `> names(tData)`
[1] "subjectid"                      "activityname"                   "meanoftBodyAccmeanX"           
 [4] "meanoftBodyAccmeanY"            "meanoftBodyAccmeanZ"            "meanoftBodyAccstdX"            
 [7] "meanoftBodyAccstdY"             "meanoftBodyAccstdZ"             "meanoftGravityAccmeanX"        
[10] "meanoftGravityAccmeanY"         "meanoftGravityAccmeanZ"         "meanoftGravityAccstdX"         
[13] "meanoftGravityAccstdY"          "meanoftGravityAccstdZ"          "meanoftBodyAccJerkmeanX"       
[16] "meanoftBodyAccJerkmeanY"        "meanoftBodyAccJerkmeanZ"        "meanoftBodyAccJerkstdX"        
[19] "meanoftBodyAccJerkstdY"         "meanoftBodyAccJerkstdZ"         "meanoftBodyGyromeanX"          
[22] "meanoftBodyGyromeanY"           "meanoftBodyGyromeanZ"           "meanoftBodyGyrostdX"           
[25] "meanoftBodyGyrostdY"            "meanoftBodyGyrostdZ"            "meanoftBodyGyroJerkmeanX"      
[28] "meanoftBodyGyroJerkmeanY"       "meanoftBodyGyroJerkmeanZ"       "meanoftBodyGyroJerkstdX"       
[31] "meanoftBodyGyroJerkstdY"        "meanoftBodyGyroJerkstdZ"        "meanoftBodyAccMagmean"         
[34] "meanoftBodyAccMagstd"           "meanoftGravityAccMagmean"       "meanoftGravityAccMagstd"       
[37] "meanoftBodyAccJerkMagmean"      "meanoftBodyAccJerkMagstd"       "meanoftBodyGyroMagmean"        
[40] "meanoftBodyGyroMagstd"          "meanoftBodyGyroJerkMagmean"     "meanoftBodyGyroJerkMagstd"     
[43] "meanoffBodyAccmeanX"            "meanoffBodyAccmeanY"            "meanoffBodyAccmeanZ"           
[46] "meanoffBodyAccstdX"             "meanoffBodyAccstdY"             "meanoffBodyAccstdZ"            
[49] "meanoffBodyAccJerkmeanX"        "meanoffBodyAccJerkmeanY"        "meanoffBodyAccJerkmeanZ"       
[52] "meanoffBodyAccJerkstdX"         "meanoffBodyAccJerkstdY"         "meanoffBodyAccJerkstdZ"        
[55] "meanoffBodyGyromeanX"           "meanoffBodyGyromeanY"           "meanoffBodyGyromeanZ"          
[58] "meanoffBodyGyrostdX"            "meanoffBodyGyrostdY"            "meanoffBodyGyrostdZ"           
[61] "meanoffBodyAccMagmean"          "meanoffBodyAccMagstd"           "meanoffBodyBodyAccJerkMagmean" 
[64] "meanoffBodyBodyAccJerkMagstd"   "meanoffBodyBodyGyroMagmean"     "meanoffBodyBodyGyroMagstd"     
[67] "meanoffBodyBodyGyroJerkMagmean" "meanoffBodyBodyGyroJerkMagstd" 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources

This CodeBook is based on the template from [Joris Schut](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41)

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
