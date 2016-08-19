
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
 - We use terminology "feature variables" below to refer 66 mean value features
 - For summarizing the data use commands `> head(tData)` and `>str(tData)`

str:

'data.frame':	180 obs. of  68 variables:

 $ subjectid                                   : int  1 1 1 1 1 1 2 2 2 2 ...
 
 $ activityname                                : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 
 $ meanoftimedomainBodyAccmeanX                : num  0.222 0.261 0.279 0.277 0.289 ...
 
 $ meanoftimedomainBodyAccmeanY                : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 
 $ meanoftimedomainBodyAccmeanZ                : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 
 $ meanoftimedomainBodyAccstdX                 : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 
 $ meanoftimedomainBodyAccstdY                 : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 
 $ meanoftimedomainBodyAccstdZ                 : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 

 - Names of the variables in data set can be seen by issuing command `> names(tData)`
 
[1] "subjectid"                                    "activityname"                                
 [3] "meanoftimedomainBodyAccmeanX"                 "meanoftimedomainBodyAccmeanY"                
 [5] "meanoftimedomainBodyAccmeanZ"                 "meanoftimedomainBodyAccstdX"                 
 [7] "meanoftimedomainBodyAccstdY"                  "meanoftimedomainBodyAccstdZ"                 
 [9] "meanoftimedomainGravityAccmeanX"              "meanoftimedomainGravityAccmeanY"             
[11] "meanoftimedomainGravityAccmeanZ"              "meanoftimedomainGravityAccstdX"              
[13] "meanoftimedomainGravityAccstdY"               "meanoftimedomainGravityAccstdZ"              
[15] "meanoftimedomainBodyAccJerkmeanX"             "meanoftimedomainBodyAccJerkmeanY"            
[17] "meanoftimedomainBodyAccJerkmeanZ"             "meanoftimedomainBodyAccJerkstdX"             
[19] "meanoftimedomainBodyAccJerkstdY"              "meanoftimedomainBodyAccJerkstdZ"             
[21] "meanoftimedomainBodyGyromeanX"                "meanoftimedomainBodyGyromeanY"               
[23] "meanoftimedomainBodyGyromeanZ"                "meanoftimedomainBodyGyrostdX"                
[25] "meanoftimedomainBodyGyrostdY"                 "meanoftimedomainBodyGyrostdZ"                
[27] "meanoftimedomainBodyGyroJerkmeanX"            "meanoftimedomainBodyGyroJerkmeanY"           
[29] "meanoftimedomainBodyGyroJerkmeanZ"            "meanoftimedomainBodyGyroJerkstdX"            
[31] "meanoftimedomainBodyGyroJerkstdY"             "meanoftimedomainBodyGyroJerkstdZ"            
[33] "meanoftimedomainBodyAccMagmean"               "meanoftimedomainBodyAccMagstd"               
[35] "meanoftimedomainGravityAccMagmean"            "meanoftimedomainGravityAccMagstd"            
[37] "meanoftimedomainBodyAccJerkMagmean"           "meanoftimedomainBodyAccJerkMagstd"           
[39] "meanoftimedomainBodyGyroMagmean"              "meanoftimedomainBodyGyroMagstd"              
[41] "meanoftimedomainBodyGyroJerkMagmean"          "meanoftimedomainBodyGyroJerkMagstd"          
[43] "meanoffrequencydomainBodyAccmeanX"            "meanoffrequencydomainBodyAccmeanY"           
[45] "meanoffrequencydomainBodyAccmeanZ"            "meanoffrequencydomainBodyAccstdX"            
[47] "meanoffrequencydomainBodyAccstdY"             "meanoffrequencydomainBodyAccstdZ"            
[49] "meanoffrequencydomainBodyAccJerkmeanX"        "meanoffrequencydomainBodyAccJerkmeanY"       
[51] "meanoffrequencydomainBodyAccJerkmeanZ"        "meanoffrequencydomainBodyAccJerkstdX"        
[53] "meanoffrequencydomainBodyAccJerkstdY"         "meanoffrequencydomainBodyAccJerkstdZ"        
[55] "meanoffrequencydomainBodyGyromeanX"           "meanoffrequencydomainBodyGyromeanY"          
[57] "meanoffrequencydomainBodyGyromeanZ"           "meanoffrequencydomainBodyGyrostdX"           
[59] "meanoffrequencydomainBodyGyrostdY"            "meanoffrequencydomainBodyGyrostdZ"           
[61] "meanoffrequencydomainBodyAccMagmean"          "meanoffrequencydomainBodyAccMagstd"          
[63] "meanoffrequencydomainBodyBodyAccJerkMagmean"  "meanoffrequencydomainBodyBodyAccJerkMagstd"  
[65] "meanoffrequencydomainBodyBodyGyroMagmean"     "meanoffrequencydomainBodyBodyGyroMagstd"     
[67] "meanoffrequencydomainBodyBodyGyroJerkMagmean" "meanoffrequencydomainBodyBodyGyroJerkMagstd"

###Variable subjectid 

int type identifier for test person. Values of this variable are between [1,30].

This variable has no unit.

###Variable activityname 

Factor type specifying different activities. This factor has 6 levels.
This variable has no unit.

`> unique(tData$activityname)`

[1] LAYING             SITTING            STANDING           WALKING            WALKING_DOWNSTAIRS

[6] WALKING_UPSTAIRS  

Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

###Details of feature variables naming convention

HARUS data contains files "features_info.txt" and "READ_ME.txt" under data set zip file's root directory "UCI HAR Dataset". To check these files you need to get  [HARUS data set zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it to check these files. These files are not used (that is read into R) during R processing since they are meta information and so you need to explicitly unzip the data set zip file to glance those.  
Based on the information provided in these 2 files there are following parts from which the feature name is composed of :

* "t" or "f" in the beginning of feature name. This means whether measurement is made on timedomain or frequencydomain (for more about these domains see [Fourier transformation](https://en.wikipedia.org/wiki/Fourier_transform)). These abbreviations will be transformed during processing so that "t" is converted into "timedomain" and "f" into "frequencydomain" in feature names
* "Acc" means that feature measurement originates smart phones accelerometer and "Gyro" that it originates from phone's gyroscope. These are not converted into feature names during processing.
* "Mag" means magnitude and it is not converted during processing 
* "Body" means effects of body movements in accelometers recordings during person's activities. It is not further converted during processing
* "Gravity" means effect of gravity in accelometers recordings during person's activities. It is not further converted during processing

Desicion which feature name components were converted during processing was based mainly by names readibility by human. Converting everythin into the longer names would produce extremely long column names and while those poses no problems for automatic R processing I felt that for human eyes choices made were a decent ones.

###Common characteristics of feature variables

There are following common characteriswtics with all feature variables

* their type is numeric
* their values are restricted to the [-1,1]. This follows from the fact that raw datas feature vectors are normalized and bounded within [-1,1] (see README.txt in HARUS data set).

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

* This CodeBook is based on the template from [Joris Schut](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41)
* [HARUS data set zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* HARUS README.txt can be found under UCI HAR Dataset directory HARUS data set zip file
* HARUS features_info.txt can be found under UCI HAR Dataset directory HARUS data set zip file

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
