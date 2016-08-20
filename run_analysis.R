## 1. Merges the training and the test sets to create one data set.
merged.data <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
# Get the features related to mean and standard deviation
features.desired <- grep("mean|std", features$V2)
# Extract only the features with mean and standard deviation features
merged.data.desired <- merged.data[, features.desired]
# Remove the original merged.data data frame
rm(merged.data)

## 3. Uses descriptive activity names to name the activities in the data set.
# Get activity labels
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Find combined activity names with train and test data sets
activity.values <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
# Make the activity names as a factor with levels and labels defined by activity.labels
activity.names <- factor(activity.values$V1, levels = activity.labels$V1, labels = activity.labels$V2)
# Add activity variable to merged.data.desired
merged.data.desired$activity <- activity.names

## 4. Appropriately labels the data set with descriptive variable names.
# Extract only the desired feature names
features.desired.names <- features[features.desired,"V2"]
# Rename variable names of merged.data.desired with above feature names
colnames(merged.data.desired) <- features.desired.names
# Rename last column as 'activity
colnames(merged.data.desired)[80] <- "activity"

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
# Add column subject to merged.data.desired with train and test subject values
merged.data.desired$subject <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))[,"V1"]
# Contains split of 'merged.data.desired' as per activity names
result.data.activity.split <- split(merged.data.desired[1:79], merged.data.desired$activity)
# Contains average data of all the features based on activity names
result.data.activity <- sapply(result.data.activity.split, colMeans)
# Contains split of 'merged.data.desired' as per subjects
result.data.subject.split <- split(merged.data.desired[1:79], merged.data.desired$subject)
# Contains average data of all the features based on subjects
result.data.subject <- sapply(result.data.subject.split, colMeans)
# Contains average data calculated as combined value (cbind) of 'result.data.activity' and 'result.data.subject'
result.data <- cbind(result.data.activity, result.data.subject)


## Write the final result data frame to result.data
write.table(result.data, "result.data.txt", row.name=FALSE)
