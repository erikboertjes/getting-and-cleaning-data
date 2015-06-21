# CodeBook
Description of the dataset in _averagePerSubjectAndActivity.txt_

This dataset is the result of the Project Course of the Coursera _Getting and Cleaning data_ course. The original data is obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The original data contains measurements from smartphone sensors while subjects where performing certain activities (like walking, standing, ect.)

The data described here, contains average values for 66 variables for each combination of subject and activity.

_subject_ The ID (ranging from 1 to 30) of the person

_activity_ The activity performed by the subject at the time the measurements where taken. Possible values:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

_Average values_ of 66 measurements grouped by subject and activity. For each of the following variables the mean and standard deviation are given (indicated by _-mean()_ and _-std()_). For some variables these values are given in each of the dimensions X,Y and Z (indicated by _-X_, _-Y_, and _-Z_).

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

For more information see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
