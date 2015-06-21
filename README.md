# Getting-and-Cleaning-Data

The run_analysis.R will do the following:
1. Read 3 train files (subject_train, X_train, y_train) and 3 test files (subject_test, X_test, y_test)
2. Merge those 3 train files into 1 train file; Merge those 3 test files into 1 test file
3. Merges the train and test data to create one data set (train_test)
4. Read features and activity_labels
5. Rename the column names of activity_labels data set
6. Rename the column names of train_test data set
7. join activity_labels and train_test data by ActivityId = Activity to get Activity label
8. select Subject, Activity, columns contains "mean()" or contains "std()"
9. group train_test_mean_std data by Subject and Activity
10. calculate the average value of all columns broken down by Subject and Activity
11. export the tidy_data_set into txt file


Project Instruction:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
