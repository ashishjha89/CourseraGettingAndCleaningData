## <u>How to setup</u>

* 1. Fetch the data for the project from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* 2. Unzip to your working directory
* 3. Execute the script run_analysis.R from that directory.

## <u>Variables and transformations</u>

* 'merged.data' : Contains merged training and the test sets to create one data set ("UCI HAR Dataset/train/X_train.txt" and "UCI HAR Dataset/test/X_test.txt")
* 'features' : Contains all the features for the data set (specified in the filepath - "UCI HAR Dataset/features.txt")
* 'features.desired' : Contains only the features having mean and standard deviation related features
* 'features.desired.names' : Contains only the names from 'features.desired' data frame
* 'merged.data.desired' : Contains the measurements on the mean and standard deviation for each measurement in 'merged_data'. Activity names and subject variables are added to it.
* 'activity.labels' : Contains the activity label names (specified in the filepath - "UCI HAR Dataset/activity_labels.txt")
* 'activity.names' : Factor storing activity names (specified in the filepath - "CI HAR Dataset/train/y_train.txt" and "CI HAR Dataset/test/y_test.txt") with levels and labels provided by 'activity.labels'
* 'result.data.activity.split' : Contains split of 'merged.data.desired' as per activity names
* 'result.data.activity' : Contains average data of all the features based on activity names
* 'result.data.subject.split' : Contains split of 'merged.data.desired' as per subjects
* 'result.data.subject' : Contains average data of all the features based on subjects
* 'result.data' : Contains average data calculated as combined value (cbind) of 'result.data.activity' and 'result.data.subject'
