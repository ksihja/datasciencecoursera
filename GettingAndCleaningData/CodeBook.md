
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
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

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
