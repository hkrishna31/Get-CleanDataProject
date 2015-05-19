
Script run_analysis.R creates tidydata() function to convert UCI data (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
to tidy data set following the instructions in course project.

Download the data and unzip it. Below are the descriptions of each file(that are used in the script and are needed by project).

1) subject_test.txt - Contains the IDs of test volunteers (subjects) whose activity metrics are recorded.
2) X_test.txt - Contains measures for each of the activities for test volunteers.
3) Y_test.txt - Contains Activity IDs for each of the activity being measured for test Volunteers.
4) activity_labels.txt - Contains labels for Activities (contained in Y_test/train.txt)
5) features.txt - Contains names of the measures. (measures are present in file X_test/train.txt)

tidydata() does the following
-----------------------------

1) Combines Test and Training Data using rbind and stores in a data frame.
2) Assigns labels to activities and measures, thus tidying the data.
3) Gets average of Mean and Standard Deviation measures by Subject and Activity and writes it to a text file("UCITidyData.txt").


Pre-requisites
---------------
Script uses(loads) the below libraries. So make sure that you install these packages, if they do not exist.

1) plyr
2) dplyr
3) stringr
4) reshape2


Steps to execute the script
---------------------------
1) Source run_analysis.R script
2) download and unzip the data.
3) Set "UCI HAR Dataset" as your working directory.
4) Type tidydata() (to execute function) to generate tidy data set.

Description of Variables used in script
--------------------------------------

1) test_subject - Contains data read from test_subject.txt 

2) train_subject - Contains data read from train_subject.txt

3) subject - Contains Merged data from test_subject.txt and train_subject.txt

4) test_X - Contains data read from X_test.txt

5) train_X - Contains data read from X_train.txt

6) X - Contains merged data from X_test.txt and X_train.txt

7) test_Y - Contains data read from Y_test.txt

8) train_Y - Contains data read from Y_train.txt

9) Y - Contains merged data from Y_test.txt and Y_train.txt

10) features - contains data read from features.txt

11) mstd - contains list of values which represent the position of text containing "mean" or "std" in the features data frame

12) activities - contains data read from activity_labels.txt

13) tdata1 - Merged data frame which contains subject (volunteers),activities tracked for subjects(Y) and measurements of those 
	     actvivities(X).

14) tdata2 - Melted tdata1,where measure are arranged as a variable column (name & value pair).

15) tdata3 - Data frame containing average of mean and standard deviation measures per Subject (volunteer) and Activity.
