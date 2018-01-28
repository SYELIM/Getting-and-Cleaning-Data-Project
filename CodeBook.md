# CodeBook for Week 4 Project

## Dataset information:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:
>For each record in the dataset it is provided: 
>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
>- Triaxial Angular velocity from the gyroscope. 
>- A 561-feature vector with time and frequency domain variables. 
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.
(source:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Steps:
1.	Datasets required for this project were read using `read.table()` function. 

2.	Column names were assigned to datasets read:
    - For `X_train.txt` and `X_test.txt`, originally, the columns were named V1,…,Vn. These were renamed by the second columns of -`features.txt`:
- `tBodyAcc-XYZ`
- `tGravityAcc-XYZ`
- `tBodyAccJerk-XYZ`
- `tBodyGyro-XYZ`
- `tBodyGyroJerk-XYZ`
- `tBodyAccMag`
- `tGravityAccMag`
- `tBodyAccJerkMag`
- `tBodyGyroMag`
- `tBodyGyroJerkMag`
- `fBodyAcc-XYZ`
- `fBodyAccJerk-XYZ`
- `fBodyGyro-XYZ`
- `fBodyAccMag`
- `fBodyAccJerkMag`
- `fBodyGyroMag`
- `fBodyGyroJerkMag`
    - For `y_train.txt` and `y_test.txt`, column name was assigned as `ActivityID`
    - For `subject_train.txt` and `subject_test.txt`, column name was assigned as `SubjectID`
    - For `activity_label.txt`, the first column was named as `ActivityID`, second one as `Activity_label`.
    
3. Using `cbind()` and `rbind()` merged all datasets.

4. Selection of `ActivityID`, `SubjectID`, `mean` and `std` was done using `grepl()` function. This was returned as logical vector.

5. After the selection of necessary data, the specific number of activity performance was replaced by its detailed description: 
- `1` = `WALKING`
- `2` = `WALKING_UPSTAIRS`
- `3` = `WALKING_DOWNSTAIRS`
- `4` = `SITTING`
- `5` = `STANDING`
- `6` = `LAYING`

6.	Descriptive activity names were edited using `gsub()`.

7.	The average of each variable for each activity and each subject was created as `tidyData.txt` file.  
