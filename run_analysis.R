library(dplyr)

#Download and prepare data

dlurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "UCI HAR Dataset.zip"
download.file(dlurl, filename)

if(file.exists(filename)) unzip(filename)

## STEP 1: Merges the training and the test sets to create one data set

#Move data into data frames
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

# 1. Merges the training and the test sets 
X <- rbind(x_train,x_test)
Y <- rbind(y_train,y_test)
names(Y) <-  'activity'
Subject <- rbind(subject_train, subject_test)
names(Subject) <- 'subject'


## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

meanstdev <- grep("mean()|std()", features[, 2]) 
initialSet <- X[,meanstdev]

Data_Merge <- cbind(Subject, Y, initialSet)


## STEP 3: Uses descriptive activity names to name the activities in the data set
act_lab <- factor(Data_Merge$activity)
levels(act_lab) <- activity_labels[,2]
Data_Merge$activity <- act_lab

# STEP 4: Appropriately labels the data set with descriptive variable names.
names(Data_Merge)<-gsub("Acc", "Accelerometer", names(Data_Merge))
names(Data_Merge)<-gsub("Gyro", "Gyroscope", names(Data_Merge))
names(Data_Merge)<-gsub("BodyBody", "Body", names(Data_Merge))
names(Data_Merge)<-gsub("Mag", "Magnitude", names(Data_Merge))
names(Data_Merge)<-gsub("^t", "Time", names(Data_Merge))
names(Data_Merge)<-gsub("^f", "Frequency", names(Data_Merge))
names(Data_Merge)<-gsub("tBody", "TimeBody", names(Data_Merge))
names(Data_Merge)<-gsub("-mean()", "Mean", names(Data_Merge), ignore.case = TRUE)
names(Data_Merge)<-gsub("-std()", "STD", names(Data_Merge), ignore.case = TRUE)
names(Data_Merge)<-gsub("-freq()", "Frequency", names(Data_Merge), ignore.case = TRUE)
names(Data_Merge)<-gsub("angle", "Angle", names(Data_Merge))
names(Data_Merge)<-gsub("gravity", "Gravity", names(Data_Merge))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
SecondData <- Data_Merge %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
# Writing data out to a file
write.table(SecondData, "SecondData.txt", row.name=FALSE)
