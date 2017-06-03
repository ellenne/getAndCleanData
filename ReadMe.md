Getting-and-Cleaning-Data-Week-4-Assignment
-------------------------------------------

-   1st: Download the data file
-   2nd: Unzip the file into your R working folder
-   3rd: Take my R code and save into the working folder
-   4th: Run the script and generate the output file

### The Data

Variables named X represent sensor signals measured with wearable
technology from 30 humans. Variables in the data Y are activity type the
person was doing during recording.

### The R Code

The R script combines training and test set, then creates another
dataset containing the averages of the variables for each activity.

### The output

The output containes variables based on the average and standard
deviation. Each row is an average of a given activity.

### This is the assignment

First, download and unzip the data file into your R working directory.
Second, download the R source code into your R working directory.
Finally, execute R source code to generate tidy data file.

1.  Merges the training and the test sets to create one data set. Use
    command rbind to combine training and test set
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement. Use grep command to get column indexes for
    variable name contains "mean()" or "std()"
3.  Uses descriptive activity names to name the activities in the data
    set Convert activity labels to characters and add a new column as
    factor
4.  Appropriately labels the data set with descriptive variable names.
    Give the selected descriptive names to variable columns
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject. Use pipeline command to create a new tidy dataset with
    command group\_by and summarize\_each in dplyr package
