#Load dplyr package
library(dplyr)

#Read in the activity label file
Activity_label<- read.table("activity_labels.txt")

#Read in the train labels and test labels 
testDatay<- read.table("y_test.txt")
trainDatay<- read.table("y_train.txt")

#Label the train and test labels
testDatay<- merge(testDatay, Activity_label, by="V1")
trainDatay<- merge(trainDatay, Activity_label, by="V1")

#Read in test results and training results
testDatax<- read.table("X_test.txt")
trainDatax<- read.table("X_train.txt")

#Read in features table
Features<-read.table("features.txt")
#Since some of the labeling are duplicated and we are not using those columns, I will trim those columns from features and dataset
Featuresnew<- Features[-c(303:344, 382:423, 461:502),]
testDataxnew<- testDatax[, -c(303:344, 382:423, 461:502)]
trainDataxnew<- trainDatax[,-c(303:344, 382:423,461:502)]

#Label test and training results with descriptive names
names(testDataxnew)<- Featuresnew$V2
names(trainDataxnew)<- Featuresnew$V2

#Read in subject data
Subtest<- read.table("subject_test.txt")
Subtrain<- read.table("subject_train.txt")

#For test and training dataset, extracts the measurements on mean and sd, add column 'class' to indicate train or test
testData_MeanStd<- testDataxnew %>%
  select(contains("mean()"),contains("std()")) 

trainData_MeanStd<- trainDataxnew %>%
  select(contains("mean()"),contains("std()")) 

#add in subject and activity information
testData<- cbind(class="test", subject=Subtest$V1, activity=testDatay$V2, testData_MeanStd)
trainData<- cbind(class="train", subject=Subtrain$V1, activity=trainDatay$V2, trainData_MeanStd)

#Combine test and train dataset
Alldata<- rbind(testData,trainData)

#generate the summary table and output txt file
dataSummary<- Alldata %>% 
  group_by(activity, subject) %>%
  summarise_each(funs(mean), -c(class, subject, activity))
write.table(dataSummary, file="dataSummary.txt", row.name=F)
