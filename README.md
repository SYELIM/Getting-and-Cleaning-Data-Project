# Course 3: Getting and Cleaning Data Week 4 Project

# Introduction: 
Data science is being actively applied to wearing computing, and companies such as Fitbit, Nike, and Jawbone Up’s goal is to develop advanced and better algorithms that lead to the attraction of new users.  
The purpose of this project is to get and organize the downloaded datasets from “Human Activity Recognition Using Smartphones” study. 
In this study, study participants were carrying Samsung Galaxy S II smartphone on their waist, and were told to perform simple activities: walking, walking upstairs, walking downstairs, sitting, standing, laying. 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were collected using accelerometer and gyroscope that were embedded in Galaxy S II. 
Check the following link for further details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

# Components of the project:
-	Readme.md: Brief explanation of the study, and components of the project
-	Codebook.md: Explanation of variables, data, transformation, and any other processes that have been done to make the final tidy data. 
-	Run_analysis.R: the code used to tidy the dataset.
-	Tidydata: final result after some organization and cleaning of the raw dataset. 

# Steps followed to create a tidy dataset:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
