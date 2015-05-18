
Script run_analysis.R converts UCI data (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
to tidy data set following the instructions in course project.

Download the data and unzip it. Below are the descriptions of each file(that are used in the script and are needed by project).

1) subject_test.txt - Contains the IDs of test volunteers (subjects) whose activity metrics are recorded.
2) X_test.txt - Contains measures for each of the activities for test volunteers.
3) Y_test.txt - Contains Activitiy IDs for each of the activity being measured for test Volunteers.
4) activity_labels.txt - Contains labels for Activities (contained in Y_test/train.txt)
5) features.txt - Contains names of the measures. (measures are present in file X_test/train.txt)

Then copy the script to "UCI HAR Dataset" folder.Set it as working directory in R.
Execute the script using - source("run_analysis.R")

Script does the following

1) Combines Test and Training Data using rbind and stores in a dataframe.
2) Assigns labels to activities and measures, thus tidying the data.
3) Gets average of Mean and Standard Devation measures by Subject and Activity and writes it to a csv file("UCITidyData.csv").
