#1. Merge the training and the test sets to create one data set.
##Download file and unzip 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./samsung.zip")
dateDownloaded <- date()
unzip("./samsung.zip")

##Read unzipped datasets
x_training <- read.table("../R/UCI HAR Dataset/train/X_train.txt")
y_training <- read.table("../R/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("../R/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("../R/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("../R/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("../R/UCI HAR Dataset/test/subject_test.txt")

feature <- read.table("../R/UCI HAR Dataset/features.txt")
activity_label <- read.table("../R/UCI HAR Dataset/activity_labels.txt")


##Set column names
colnames(x_training) <- feature[,2]
colnames(y_training) <- "ActivityID"
colnames(subject_train) <- "SubjectID"
colnames(activity_label) <- c("activity_label", "ActivityID")

colnames(x_test) <- feature[,2]
colnames(y_test) <- "ActivityID"
colnames(subject_test) <- "SubjectID"

##Combine datasets
training_data <- cbind(x_training, y_training,subject_train)
test_data <- cbind(x_test, y_test, subject_test)
combined_data <- rbind(training_data, test_data)

##Make a column names vector using combined_data
columnNames <- colnames(combined_data)

#2. Extract only the measurements on the mean and SD for each measurement
##Create logical vector for activity ID, subject ID, mean and SD
mean_SD <- (grepl("ActivityID", columnNames)|
                    grepl("SubjectID", columnNames)|
                    grepl("mean", columnNames)|
                    grepl("SD", columnNames))
##Get only necessary data from mean_SD
final_mean_SD <- combined_data[ , mean_SD == TRUE]

#3. Use descriptive activity names to name the activities in the data set
##Merge combined_data with activity_label
combined_data = merge(combined_data, activity_label, by="ActivityID", all.x=TRUE)
columnNames <- colnames(combined_data)

#4. Appropriately label the dataset with descriptive activity names
##Clean up the variable names
columnNames <- gsub("[\\(\\)-]", "", columnNames)
columnNames <- gsub("^f", "Frequency Domain", columnNames)
columnNames <- gsub("^t", "Time Domain", columnNames)
columnNames <- gsub("Acc", "Accelerometer", columnNames)
columnNames <- gsub("Gyro", "Gyroscope", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- gsub("Freq", "Frequency", columnNames)
columnNames <- gsub("mean", "Mean", columnNames)
columnNames <- gsub("std", "Standard Deviation", columnNames)
columnNames <- gsub("BodyBody", "Body", columnNames)
colnames(combined_data) <- columnNames

##5. Create a second, independent tidy dataset with the average of each variable for each activity and each subject
Tidy_set = aggregate(combined_data[,names(combined_data) != c('ActivityID','SubjectID')],by=list(ActivityID=combined_data$ActivityID,SubjectID = combined_data$SubjectID),mean)
Tidy_set = merge(Tidy_set,activity_label,by='ActivityID',all.x=TRUE)
write.table(Tidy_set, './tidyData.txt',row.names=TRUE,sep='\t')
