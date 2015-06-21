# load required library
library(dplyr)

# set working directory 
setwd("C:/Users/Stanley/Desktop/Coursea/Johns Hopkins University/Getting and Cleaning Data/Project")

# read three train files: 1) subject_train, 2) X_train, 3) y_train into R data
subject_train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt", blank.lines.skip=FALSE, header=FALSE)
X_train <- read.table(file="./UCI HAR Dataset/train/X_train.txt", blank.lines.skip=FALSE, header=FALSE)
y_train <- read.table(file="./UCI HAR Dataset/train/y_train.txt", blank.lines.skip=FALSE, header=FALSE)

# merge subject_train, X_train, and y_train data into one train data
train <- cbind(X_train, subject_train, y_train)

# read three test files: 1) subject_test, 2) X_test, 3) y_test into R data
subject_test <-read.table(file="./UCI HAR Dataset/test/subject_test.txt", blank.lines.skip=FALSE, header=FALSE)
X_test <-read.table(file="./UCI HAR Dataset/test/X_test.txt", blank.lines.skip=FALSE, header=FALSE)
y_test <-read.table(file="./UCI HAR Dataset/test/y_test.txt", blank.lines.skip=FALSE, header=FALSE)

# merge subject_test, X_test, and y_test data into one test data
test <- cbind(X_test, subject_test, y_test)

# merge train and test data together
train_test <- rbind(train, test)

# read features and activity_labels into R data ojects
features <- read.table(file="./UCI HAR Dataset/features.txt", blank.lines.skip=FALSE, header=FALSE)
activity_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt", blank.lines.skip=FALSE, header=FALSE)

# rename the column names of activity_labels data
names(activity_labels) <- c("ActivityId", "Activity")

# rename the column names of train_test data
names(train_test) <- c(as.character(features[,2]), "Subject", "Activity")

# join activity_labels and train_test data by ActivityId = Activity to get Activity label
train_test <- merge(activity_labels, train_test, by.x="ActivityId", by.y="Activity")

# select Subject, Activity, columns contains "mean()" or contains "std()" 
train_test_mean_std <- train_test %>% select(-c(ActivityId)) %>% select(Subject, Activity, contains("mean()"), contains("std()"))

# group train_test_mean_std data by Subject and Activity
train_test_mean_std_by_sub_act <- group_by(train_test_mean_std, Subject, Activity)

# calculate the average value of all columns broken down by Subject and Activity
tidy_data_set <- summarise_each(train_test_mean_std_by_sub_act, funs(mean))

# export the tidy_data_set into txt file
write.table(tidy_data_set, file="./UCI HAR Dataset/tidy_data_set.txt" ,row.name=FALSE)
