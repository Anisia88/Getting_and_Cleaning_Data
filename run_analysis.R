## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# To run the code effectively for merging the dataset, the original data file [UCI HAR Dataset-unzipped] should be in the working directory.
# If original data file is not in the working directory [by using getwd() function and subsequently list.files() to view 'UCI HAR Dataset'], use setwd() to specify the path where original data file is stored.

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Load the activity labels
act_label <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load the feature labels
feat_label <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract the mean and standard deviation from features.
extract_features <- grepl("mean|std", feat_label)

# Load and process from test: X_test, y_test and subject_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = feat_label

# Extract only the mean and SD features for test data.
X_test = X_test[,extract_features]

# Load activity labels for test data
y_test[,2] = act_label[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind test data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)   

# Load and process from train: X_train, y_train and subject_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = feat_label

# Extract only the mean and SD features for train data
X_train = X_train[,extract_features]

# Load activity label for train data
y_train[,2] = act_label[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind train data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
dataset = rbind(test_data, train_data)
id_vars = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(dataset), id_vars)
melt_data = melt(dataset, id = id_vars, measure.vars = data_labels)

# Apply mean function to dataset through dcast function
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt")
