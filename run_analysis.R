##### Coursera: Getting and Cleaning Data #####
### Week 4 Peer-graded Assignment Course Project ###


setwd("./UCI HAR Dataset")
library(data.table)



### 1. Merges the training and the test sets to create one data set.

# Load relevant data in
features <- read.table("./features.txt", header=FALSE)
activityLabels <- read.table("./activity_labels.txt", header=FALSE)
subjectTrain <-read.table("./train/subject_train.txt", header=FALSE)
xTrain <- read.table("./train/X_train.txt", header=FALSE)
yTrain <- read.table("./train/y_train.txt", header=FALSE)
subjectTest <-read.table("./test/subject_test.txt", header=FALSE)
xTest <- read.table("./test/X_test.txt", header=FALSE)
yTest <- read.table("./test/y_test.txt", header=FALSE)

# Assign column names
colnames(activityLabels) <- c("activityID", "activityType")
colnames(subjectTrain) <- "subID"
colnames(xTrain) <- features[, 2]
colnames(yTrain) <- "activityID"
colnames(subjectTest) <- "subID"
colnames(xTest) <- features[, 2]
colnames(yTest) <- "activityID"

# Combine data together
trainData <- cbind(yTrain, subjectTrain, xTrain)
testData <- cbind(yTest, subjectTest, xTest)
combinedData <- rbind(trainData, testData)



### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*|subID|activityID", names(combinedData), ignore.case=TRUE)
data_mean_std <- combinedData[,columnsWithMeanSTD]



### 3. Uses descriptive activity names to name the activities in the data set

extractedData <- merge(data_mean_std, activityLabels, by='activityID', all.x=TRUE)



### 4. Appropriately labels the data set with descriptive variable names.

names(extractedData) <- gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData) <- gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData) <- gsub("BodyBody", "Body", names(extractedData))
names(extractedData) <- gsub("Mag", "Magnitude", names(extractedData))
names(extractedData) <- gsub("^t", "Time", names(extractedData))
names(extractedData) <- gsub("^f", "Frequency", names(extractedData))
names(extractedData) <- gsub("tBody", "TimeBody", names(extractedData))
names(extractedData) <- gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("angle", "Angle", names(extractedData))
names(extractedData) <- gsub("gravity", "Gravity", names(extractedData))
names(extractedData)



### 5. From the data set in step 4, creates a second, independent tidy data set with the 
###    average of each variable for each activity and each subject.

extractedData$subID <- as.factor(extractedData$subID)
extractedData <- data.table(extractedData)
tidyData <- aggregate(. ~subID + activityID, extractedData, mean)
tidyData <- tidyData[order(tidyData$subID,tidyData$activityID),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)



# Dataset acknowledgement: 
# 
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
# International Workshop of Ambient Assisted Living (IWAAL 2012).
# Vitoria-Gasteiz, Spain. Dec 2012
# 
# This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse.
# Any commercial use is prohibited.
# 
# Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.