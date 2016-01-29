library(plyr)
library(dplyr)

# load the train and test data and combine the two sets of data together
train = read.table("UCI HAR Dataset\\train\\X_train.txt")
test = read.table("UCI HAR Dataset\\test\\X_test.txt")

# combine train and test into one dataframe
allData = rbind(train,test)

# read the feature file which contains the column names
features = read.csv("UCI HAR Dataset\\features.txt", sep=" ", header=FALSE)

# only get the column index of names with "mean(" or "std("
#  the "(" ensures we dont' pick up meanFreq data
stdMeanCols = grep("mean\\(|std\\(",features$V2)

# extract columns for just the mean/std measurements data
stdMeanData = allData[,stdMeanCols]

# get the column names with "mean(" or "std(" 
#  then clean up the column names
featureNames = grep("mean\\(|std\\(",features$V2, value=TRUE)
stdMeanNames = gsub("-",".",gsub("\\(\\)", "", featureNames))

# set the cleaned column names for the mean/std measurements data
names(stdMeanData) = stdMeanNames

# load test and train activity and the activity label
trainActivity = read.table("UCI HAR Dataset\\train\\y_train.txt")
testActivity = read.table("UCI HAR Dataset\\test\\y_test.txt")
activityLabel = read.table("UCI HAR Dataset\\activity_labels.txt")

# bind the train and test rows together in the same way as the data
#  then merge with the activity label to create a list of activity strings
activityType = join(rbind(trainActivity,testActivity),activityLabel)[,2]

# bind the activity data with the matching mean/std measurements data
stdMeanDataWithActivity = cbind(stdMeanData,activityType)

# load and bind subject id
trainSubject = read.table("UCI HAR Dataset\\train\\subject_train.txt")
testSubject = read.table("UCI HAR Dataset\\test\\subject_test.txt")
subjectId = as.factor(rbind(trainSubject,testSubject)$V1)
stdMeanDataWithActivityAndSubject = cbind(stdMeanDataWithActivity,subjectId)

# group by activityType and subject ID, 
#   then use summarize_each to get mean of each column
avgStdAndMeanData = group_by(stdMeanDataWithActivityAndSubject,activityType,subjectId) %>% summarize_each(funs(mean))

# output data
write.table(avgStdAndMeanData, "summaryOfMeanAndStdSmartphoneData.txt", row.names = FALSE)