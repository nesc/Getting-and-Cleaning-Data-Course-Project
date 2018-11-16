##Course work

#Connect the library
library(dplyr)

#Data loading
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
Y_test = read.table("UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

X_train = read.table("UCI HAR Dataset/train/X_train.txt")
Y_train = read.table("UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

features = read.table("UCI HAR Dataset/features.txt")
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")

#Checking the downloaded data
head(X_test)
head(Y_test)
head(subject_test)

head(X_train)
head(Y_train)
head(subject_train)

head(features)
head(activity_labels)

#Rename columns
namecolXtest <- gsub("-", "_", features$V2)
namecolXtest <- gsub("[^a-zA-Z\\d_]", "", namecolXtest)
names(X_test) <- make.names(names = namecolXtest, unique = TRUE, allow_ = TRUE)

namecolXtrain <- gsub("-", "_", features$V2)
namecolXtrain <- gsub("[^a-zA-Z\\d_]", "", namecolXtrain)
names(X_train) <- make.names(names = namecolXtrain, unique = TRUE, allow_ = TRUE)

#Replace the activity number with the name
names(Y_test) <- "Activity"  
Y_test$Activity <- factor(Y_test$Activity, levels = activity_labels$V1, labels = activity_labels$V2)

names(Y_train) <- "Activity"
Y_train$Activity <- factor(Y_train$Activity, levels = activity_labels$V1, labels = activity_labels$V2)

#Rename column
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

#Connect all in one date set
merge <- rbind(
  cbind(X_test, Y_test, subject_test),
  cbind(X_train, Y_train, subject_train)
)

#Let's select columns with mean and std
merge2 <- select(merge,
  matches("mean|std"), 
  one_of("Subject", "Activity")
)

#Collect data stack
data <- melt(
  merge2, 
  id = c("Subject", "Activity"), 
  measure.vars = setdiff(colnames(merge2), c("Subject", "Activity"))
) 

#Find the average values for each subject and test.
dataout <- dcast(data, Subject + Activity ~ variable, mean)

##Save to .txt file
write.table(dataout, file = "OutData.txt", sep = ",", row.names = FALSE)

##Save to .csv file
write.table(dataout, file = "OutData.csv", sep = ",", row.names = FALSE)

