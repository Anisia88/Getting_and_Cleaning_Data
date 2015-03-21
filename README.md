Getting and Cleaning Data: Course Project - Peer Assignment
============================================================

### Introduction

* This repo contains the assignment for Course Project under "Getting and Cleaning data" which is a part of the Data Science specialization. 

### Obtaining the Dataset

* This Course project uses the "Human Activity Recognition Using Smartphones Dataset" which can be downloaded from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

* After unzipping, the file by default is named ‘UCI HAR Dataset’.

###  Pre-requisites for running the script

* The ‘UCI HAR Dataset’ must be extracted and unzipped in the working directory.
* Step 1. Start R or RStudio.
* Step 2. getwd()
* Step 3. list.files() ## if the file ‘UCI HAR Dataset’ is contained in the list, proceed with running ‘run_analysis.R’ script. if the file ‘UCI HAR Dataset’ is not contained in the list, proceed to Step 4.
* Step 4. setwd()  ## specify the file path where ‘UCI HAR Dataset’ is located/saved. Repeat Step 2 to view the changed working directory. Repeat Step 3: you should be able to view ‘UCI HAR Dataset’, if the file path was correctly specified. Then, proceed with running ‘run_analysis.R’ script.

* The script will create a tidy data set containing mean and standard deviation per subject/volunteer for the experiment and per activity. The tidy dataset will be written to a text file called tidy_data.txt.

### Description of Code Book
* This code book provides a brief overview on the dataset, files included in the ‘UCI HAR Dataset’, the variables, the work to be performed on the dataset and working of 'run_analysis.R' code to obtain the tidy dataset.

### Description of run_analysis.R
* Requires reshapre2 and data.table libraries.
* Load the features and activity labels.
* Load both test and train data.
* Extract the mean and standard deviation column names and data.
* Process test and train data indepndantly.
* Merge the dataset.
