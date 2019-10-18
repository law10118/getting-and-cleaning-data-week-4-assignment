#Load the necessary libraries
library(dplyr)

#set working directory 
setwd("./UCI HAR dataset")

#read the train data
x_train<-read.table("./train/x_train.txt")
y_train<-read.table("./train/y_train.txt")
sub_train<-read.table("./train/subject_train.txt")

#read the test data
x_test<-read.table("./test/x_test.txt")
y_test<-read.table("./test/y_test.txt")
sub_test<-read.table("./test/subject_test.txt")

#read the features data
features <- read.table('./features.txt')

#read the activity_label
activity_labels <- read.table("./activity_labels.txt")

#merge parts of the train & test 
x_total<-rbind(x_train,x_test)
y_total<- rbind(y_train,y_test)
sub_total <- rbind(sub_test,sub_train)

#extract the mean and std from the total
features
sorted<-features[grep( "mean|std", features[,2]),]
x_total<-x_total[,sorted[,1]]

#naming the columns 
colnames(x_total)<-sorted[,2] 
colnames(y_total) <- "activity"
colnames(sub_total) <- "subject"

#merge all dataset
total <-cbind(x_total,y_total,sub_total)

#name the variables
total$activity<-factor(total$activity, level = activity_labels[,1], labels = activity_labels[,2])
total$subject <- as.factor(total$subject)
#
total_mean <- total %>% group_by(activity,subject) %>% summarize_all(funs(mean))
#print out the final tidy data set
write.table(total_mean,'./tidy.txt',row.names = FALSE,col.names = TRUE)

