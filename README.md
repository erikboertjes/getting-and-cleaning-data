###Coursera - Data Science - Getting and Cleaning Data
 # Course Project
  This document describes the steps I performed in getting and cleaning the data for the Course Project of the Getting and Cleaning class. The corresponding code can be found in _run\_analysis.R_.

  ###Reading Files
  The following files are read and stored in variables:
  * features.txt is read in _features_ which contains all 561 variable names
  * activity\_labels.txt is read into _activity.labels_. It contains a mapping of activity IDs (as can be found in y_test.txt, see below) to descriptive names for each of these IDs.
  * test/X\_test.txt is read in _test.set_ and contains all measurements (i.e. values for each of the 561 variables) for the test data. The function used for reading this data is read.fwf, since the data has a fixed-width column format.
  * train/X\_train.txt, same as above, for the training data. Is read into the variable _test.train_
  * test/subject\_test.txt is read into _test.subject_. It contains the subject IDs for each of the measurements of the test set.
  * train/subject\_test.txt is read into _train.subject_. It contains the subject IDs for each of the measurements of the training set.
  * test/y\_test.txt is read into _test.activity_. It contains the activity IDs for each of the measurements of the test set.
  * train/y\_test.txt is read into _train.activity_. It contains the activity IDs for each of the measurements of the training set.
  ### Combining and cleaning data
  Now all data of the above data is combined into one main data frame.
  * _test.set_ and _train.set_ are appended into _data_ using the rbind function.
  * the resulting data frame get its column names from the _features_ names
  * only columns that have mean or standard deviation values are kept, all other columns are discarded. We use the grep function for this, checking on the occurence of mean() or std() in each of the column names.
  * _test.activity_ and _train.activity_ are appended by rbind resulting in the combined dataset _data.activity_.
  * The activity IDs are replaced by their more descriptive labels from _activity.labels_.
  * This data is then appended as a new column to the measurements, using the cbind function.
  * _test.subject_ and _train.subject_ are appended and are appended as a new column to the measurements set.

  At this point we have a dataframe _data_ that contains columns for subjects, activities, and 66 variables with time and frequency domain values.

  ### Summarizing data

  We use the dplyr package to calculate average values for each combination of subject and activity.
  * First we use group_by to get all unique combinations of subject and activity.
  * Then we use the function summarise_each that gives the mean value for all other 66 variables, grouped by subject and activity.
  * This data is then saved in the file _averagePerSubjectAndActivity.txt_.  
