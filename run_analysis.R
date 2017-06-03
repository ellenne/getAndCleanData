library(dplyr)

# training set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# test set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# variables names
var_names <- read.table("./UCI HAR Dataset/features.txt")

# subjects
activity_sbj <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1.Merges the training and the test sets to create 
#one data set
X_merge <- rbind(X_train, X_test)
Y_merge <- rbind(Y_train, Y_test)
Sub_merge <- rbind(Sub_train, Sub_test)

# 2.Extracts only the measurements on the mean and 
#standard deviation for each measurement.
# The regex used is a simple OR clause with the \\ 
# for escape char I am looking for the string mean() 
# or std()
sel <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
X_merge <- X_merge[,sel[,1]]

# 3.Uses descriptive activity names to name the 
# activities in the data set
colnames(Y_merge) <- "activity"
Y_merge$activitylabel <- factor(Y_merge$activity, labels = as.character(activity_sbj[,2]))
activitySbj <- Y_merge[,-1]

# 4.Appropriately labels the data set with descriptive
# variable name. Use the row index contained in the 
# 1st col of sel to select the right variables
colnames(X_merge) <- var_names[sel[,1],2]

# 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each 
# variable for each activity and each subject.

colnames(Sub_merge) <- "subject"
mergeAll <- cbind(X_merge, activitySbj, Sub_merge)
total_avg <- mergeAll %>% 
             group_by(activitySbj, subject) %>% 
             summarise_each(funs(mean))

write.table(total_avg, 
            file = "./UCI HAR Dataset/tidydata.txt", 
            row.names = FALSE, 
            col.names = TRUE)