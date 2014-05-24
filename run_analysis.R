##
##
## run_analysis.R
##
## Merges the training and the test sets to create one data set. 
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Labels the data set with descriptive activity names.
## Creates a second, tidy data set with the average of each variable for each activity and each subject.
##
## Pre-processing:
##  Downloaded "getdata-projectfiles-UCI HAR Dataset" zip file
##  Extracted all compressed files and directories to the "UCI HAR Dataset" directory below the workspace directory
##

## create paths to relevant data directories
data_directory <- "UCI HAR Dataset\\"
test_data_directory <- "UCI HAR Dataset\\test\\"
train_data_directory <- "UCI HAR Dataset\\train\\"
write_directory <- "data"
tidy_file_name <- "tidy-data.txt"

## load features
features <- read.table(paste0(data_directory,"features.txt"), header=FALSE)
names(features) <- c("code", "feature")

## create column names for test data from features table removing ".", "(", ")", ",", and "-" characters
features$feature <- as.character(features$feature)
features$feature <- gsub("[.(),]|-|_", "", as.vector(features$feature), perl=TRUE)

## load test set
test_subjects <- read.table(paste0(test_data_directory,"subject_test.txt"), header=FALSE)
names(test_subjects) <- c("subjectId")

## load test activities
test_y <- read.table(paste0(test_data_directory,"y_test.txt"), header=FALSE)
names(test_y) <- c("activity")

## load test features
test_x <- read.table(paste0(test_data_directory,"x_test.txt"), header=FALSE, sep="" )
names(test_x) <- features$feature

## one oberservation per subject and activity for test set of data
test_data <- cbind(test_subjects, test_y, test_x)

## load training set
train_subjects <- read.table(paste0(train_data_directory,"subject_train.txt"), header=FALSE)
names(train_subjects) <- c("subjectId")

## load training activities
train_y <- read.table(paste0(train_data_directory,"y_train.txt"), header=FALSE)
names(train_y) <- c("activity")

## load training features
train_x <- read.table(paste0(train_data_directory,"x_train.txt"), header=FALSE, sep="")
names(train_x) <- features$feature

## one oberservation per subject and activity for training set of data
train_data <- cbind(train_subjects, train_y, train_x)

## Merge the training and the test sets to create one data set.
all_data <- rbind(test_data, train_data)

## Extract only the measurements on the mean and standard deviation for each measurement, remove meanFreq column.
mean_std_columns <- c("subjectId", "activity", grep( "[Mm]ean[^F]|[Ss]td", features$feature, value=TRUE))
mean_std <-all_data[mean_std_columns]

## Labels the data set with descriptive activity names.
activities <- read.table(paste0(data_directory,"activity_labels.txt"), header=FALSE)
names(activities) <- c("code", "name")

## Creates a second, tidy data set with the average of each variable for each activity and each subject.
tidy_data <- do.call( rbind, by( mean_std, mean_std$subjectId, function(ds){
                do.call( rbind, by( ds, ds$activity, function(ss){
                    dt <- data.frame(subject=ds$subjectId[1], activity = ss$activity[1])
                            for( i in seq(3, (length(colnames(mean_std))))){
                                avg <- lapply( ss[i], mean )[[1]]
                                dt <- cbind( dt, avg=as.vector(avg))
                            } 
                    dt 
                }))
            }))

## give columns appropriate names
names(tidy_data) <- mean_std_columns

## alter activity column
tidy_data$activity <- as.factor( tidy_data$activity )
levels(tidy_data$activity) <- as.vector(activities$name)

## ensure there is a data directory
if (!file.exists(write_directory)){
   dir.create(write_directory)
}

## write tidy_data to data directory
write.table(tidy_data, file=paste0(write_directory, "\\", tidy_file_name), sep=",", row.names=FALSE)