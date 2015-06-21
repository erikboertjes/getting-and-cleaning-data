data.dir <- "UCI HAR Dataset" # the name of the directory containing the data.

# read the feature names
features <- read.table(file.path(data.dir,"features.txt"),sep=" ",col.names=c("index","name"))

# read activity labels
activity.labels <- read.table(file.path(data.dir,"activity_labels.txt"), col.names = c("index","name"))

# read the dataset files (first the test set, then the training set)
test.set <- read.fwf(file.path(data.dir,"test","X_test.txt"),rep(16,561))
train.set <- read.fwf(file.path(data.dir,"train","X_train.txt"),rep(16,561))

# read activity files
test.activity <- read.table(file.path(data.dir,"test","y_test.txt"))
train.activity <- read.table(file.path(data.dir,"train","y_train.txt"))

# read subject files
test.subject <- read.table(file.path(data.dir,"test","subject_test.txt"))
train.subject <- read.table(file.path(data.dir,"train","subject_train.txt"))

#combine measurement sets into one
data <- rbind(test.set,train.set)
# get column names come from feature list
colnames(data) <- features$name
# keep columns with measurements on the mean and standard deviation
data <- data[,grep("mean\\(\\)|std\\(\\)",colnames(data))]

# combine the activity data
data.activity <- rbind(test.activity, train.activity)
colnames(data.activity) <- c("activity")
# replace the label index by descriptive activity names
data.activity$activity <- activity.labels$name[data.activity$activity]
# add the activity data to the main data set
data <- cbind(data.activity, data)

# combine the subject data and add it to the data
data.subject <- rbind(test.subject, train.subject)
colnames(data.subject) <- c("subject")
data <- cbind(data.subject, data)

#calculate the average of each variable for each activity and each subject
library(dplyr)
# group by activity and subject
activity.subject <- group_by(data, subject, activity)
# calculate average for all variables, grouping by subject and activity
avg.per.activity.subject <- summarise_each(activity.subject, funs(mean))
 
#save this dataset
write.table(avg.per.activity.subject, file.path(data.dir,"averagePerSubjectAndActivity.txt"), row.names = FALSE, quote=FALSE)

