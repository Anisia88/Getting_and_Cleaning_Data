#CodeBook

This code book describes the dataset, the variables, the work to be performed on the dataset and working of 'run_analysis.R' code to obtain the tidy dataset.

## The data source:
* Original dataset: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
* Description of the dataset: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Description of DataSet:
* The subjects/volunteers who carried out the experiment are represented as a number from 1 to 30.
* The six activities performed by the subjects are labelled as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
* Using the smartphone’s (Samsung Galaxy S II) embedded accelerometer and gyroscope, a 3-axial linear acceleration and 3-axial angular velocity, was captured, at a constant rate of 50Hz. The dataset has been randomly partitioned into two sets where 70% of the subjects were selected for generating the training data and 30% the test data.

###Files included in UCI HAR Dataset:
- features_info.txt: Shows information about the variables used on the feature vector.
- features.txt: List of all features.
- NOTE: features are normalized and bounded within [-1,1]
- activity_labels.txt: Links the class labels with their activity name.

###Files in train and test Dataset (within UCI HAR Dataset):
- train/X_train.txt: Training set.
- train/y_train.txt: Training labels.
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.

## Variables in the dataset:
* The README and features.txt files in the original dataset (UCI HAR Dataset) provide in-depth description about the feature selection for this dataset. In brief the following synopsis about README and features.txt files are as follows:
* Signals were used to estimate variables of the feature vector, for each signal label '_XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Signals were captured in the Time Domain (prefix 't' to denote time) at a constant rate of 50 Hz and the Frequency Domain (prefix 'f' to denote frequency) at a frequency of 0.3 Hz. The features selected for the database come from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* The acceleration signal is separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using low pass Butterworth filter with a corner frequency of 0.3 Hz. The magnitude of these three-dimensional signals were calculated using the Euclidean norm producing tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag.
* A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

###The variables estimated from these signals that are used for the assignment are:
- mean(): Mean
- std(): Standard deviation

###For each measurement the mean and Standard deviation is calculated.

## Create an independent tidy data set. The Steps are as follows:
* Step 1: Merges the training and the test sets to create one data set.
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
* Step 3: Uses descriptive activity names to name the activities in the data set
* Step 4: Appropriately labels the data set with descriptive activity names.
* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the 'run_analysis.R' code:
* Requires reshapre2 and data.table libraries.
* Load the features and activity labels.
* Load both test and train data.
* Extract the mean and standard deviation column names and data.
* Process test and train data indepndantly.
* Merge the dataset.