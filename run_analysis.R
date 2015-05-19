

tidydata <- function()

{

#Below scripts reads and coverts UCI Human Activity Recognition Data into Tidy Data 

# load required Libraries
suppressWarnings(library(plyr))
suppressWarnings(library(dplyr))
library(stringr)
library(reshape2)


########
#Step 1 - Merges the training and the test sets to create one data set

# read subjects data from test set
test_subject<-read.table("./test/subject_test.txt") 

# read subjects data from training set
train_subject<-read.table("./train/subject_train.txt") 

# Merge test and training subjects
subject<-rbind(test_subject,train_subject) 

# Read X(measures) from test set
test_X<-read.table("./test/X_test.txt") 

# Read X(measures) from training set
train_X<-read.table("./train/X_train.txt") 

# Merge X (Measures) for both test and training sets
X<-rbind(test_X,train_X) 

# Read Y (Activity IDs) for test set
test_Y<-read.table("./test/Y_test.txt") 

# Read Y (Activity IDs) for training set
train_Y<-read.table("./train/Y_train.txt") 

# Merge Y (Activity IDs) for both test and training sets
Y<-rbind(test_Y,train_Y) 

#########
#Step2 - Extracts only Mean and Standard Deviation measures from X (measures)

# Read Measure (present in X) labels
features<-read.table("features.txt",stringsAsFactors=FALSE) 

# Find row Position where there are mean or std measurements (in 2nd column)
mstd<-c(grep("mean",features$V2),grep("std",features$V2)) 

# From X select only those columns which have Mean or STD and store it in X.
X<-X[,mstd] 

#########
# Step3 - Provide descriptive Activities names to Activities (Y).

# Read Activity ID & labels
activities <- read.table("activity_labels.txt") 

# Add Activity Name (labels) to IDs in Y. 
#Y<-merge(Y,activities,by.x="V1",by.y="V1",all.x=TRUE) 
Y<-join(Y,activities,by="V1")

#########
#Step4 - Label data sets with descriptive Names

names(subject)<-"SubjectID" # Names this as Subject ID, since it contains IDs for Subjects (People) under study

names(features)<-c("MetricID","MetricName") # Features contain Metric Names(labels)

names(X)<-features[mstd,"MetricName"] # X contains measures (mean & std only). This gets the corresponding labels (names) from features

names(Y)<-c("ActivityID","ActivityName") # Y contains Activity IDs and Names, so labeling it accordingly.

#########
#Step5 - Create Tidy data set with average of each measure for each Activity & Subject

# Create a single data set which has Subjects (subjects),Activities of Subjects(Y),Measures of Activities(X)
tdata1<-cbind(subject,Y,X)

# Arrange data to have less width, so that all measures fall into a single column(variable)
tdata2<-melt(tdata1,id.vars=c("SubjectID","ActivityID","ActivityName")) 

# Calculate mean of all measures and arrange them similar to original table structure
tdata3<-dcast(tdata2,SubjectID+ActivityID+ActivityName~variable,mean)

# Create a text file with tidy data set.
write.table(tdata3,"UCITidyData.txt",sep=",",row.names=FALSE)

} # End of Function
