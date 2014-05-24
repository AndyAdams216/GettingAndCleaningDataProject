#Code Book

## summary choices

## study design
Input the training ('train/X_train.txt') and the test ('test/X_test.txt') sets.
Cross referenced participants data against their respective training ('subject_train.txt') and test ('subject_test.txt') subject data and activites against the appropriate training ('y_train.txt') and test ('y_test.txt') activity data.
Further cross reference the participants activity codes in the training and test data sets against the 'activity_labels.txt' file and their measurement readings against the 'features.txt' file.
Merged the training and test data sets to create one data set
Extracted the measurements on the mean and standard deviation for each measurement, omitting average frequency measurements. 
Created a comma delimitted data set ('tidy-data.txt') consisting of the average of each selected variable for each activity and each subject. The column headings together with their values are delineated below.

## variables and values
###subjectId
    number in range 1..30 representing the total number of participants
###activty
    One of the six activities the participants were asked to do well wearing a smartphone (Samsung Galaxy S II) on their waist :-
    "WALKING"
    "WALKING_UPSTAIRS"   
    "WALKING_DOWNSTAIRS" 
    "SITTING"            
    "STANDING"           
    "LAYING"
    
###tBodyAccmeanX
###tBodyAccmeanY
###tBodyAccmeanZ
###tBodyAccstdX
###tBodyAccstdY
###tBodyAccstdZ
###tGravityAccmeanX
###tGravityAccmeanY
###tGravityAccmeanZ
###tGravityAccstdX
###tGravityAccstdY
###tGravityAccstdZ
###tBodyAccJerkmeanX
###tBodyAccJerkmeanY
###tBodyAccJerkmeanZ
###tBodyAccJerkstdX
###tBodyAccJerkstdY
###tBodyAccJerkstdZ
###tBodyGyromeanX
###tBodyGyromeanY
###tBodyGyromeanZ
###tBodyGyrostdX
###tBodyGyrostdY
###tBodyGyrostdZ
###tBodyGyroJerkmeanX
###tBodyGyroJerkmeanY
###tBodyGyroJerkmeanZ
###tBodyGyroJerkstdX
###tBodyGyroJerkstdY
###tBodyGyroJerkstdZ
###tBodyAccMagstd
###tGravityAccMagstd
###tBodyAccJerkMagstd
###tBodyGyroMagstd
###tBodyGyroJerkMagstd
###fBodyAccmeanX
###fBodyAccmeanY
###fBodyAccmeanZ
###fBodyAccstdX
###fBodyAccstdY
###fBodyAccstdZ
###fBodyAccJerkmeanX
###fBodyAccJerkmeanY
###fBodyAccJerkmeanZ
###fBodyAccJerkstdX
###fBodyAccJerkstdY
###fBodyAccJerkstdZ
###fBodyGyromeanX
###fBodyGyromeanY
###fBodyGyromeanZ
###fBodyGyrostdX
###fBodyGyrostdY
###fBodyGyrostdZ
###fBodyAccMagstd
###fBodyBodyAccJerkMagstd
###fBodyBodyGyroMagstd
###fBodyBodyGyroJerkMagstd
###angletBodyAccMeangravity
###angletBodyAccJerkMeangravityMean
###angletBodyGyroMeangravityMean
###angletBodyGyroJerkMeangravityMean
    double precision averages and standard deviations about the X, Y and Z axis as calculated in the training and test data sets, originally collated from the inertial signals in the data set.
    