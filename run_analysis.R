library(reshape2)

##Functions - Descriptions within Functions
TempDir <- function(url){
  #Downloads zip file and opens connections to temporary file holding contents
  tmpdir <- tempdir()
  file <- basename(url)
  download.file(url, file,method = "curl")
  unzip(file, exdir = tmpdir )
  tmpdir
}
ReadData<-function(tmpdir){
  #Read in data from tables and combine into one
  testX <-read.table(paste(tmpdir,"/UCI HAR Dataset/test/X_test.txt",sep=""))
  testY<-read.table(paste(tmpdir,"/UCI HAR Dataset/test/Y_test.txt",sep=""))
  subjectTest <- read.table(paste(tmpdir,"/UCI HAR Dataset/test/subject_test.txt",sep=""))
  trainX <-read.table(paste(tmpdir,"/UCI HAR Dataset/train/X_train.txt",sep=""))
  trainY<-read.table(paste(tmpdir,"/UCI HAR Dataset/train/Y_train.txt",sep=""))
  subjectTrain <- read.table(paste(tmpdir,"/UCI HAR Dataset/train/subject_train.txt",sep=""))
  testAndTrain <-rbind(cbind(testX,testY,subjectTest),cbind(trainX,trainY,subjectTrain))
}
SubsetData <-function(tmpdir,data) {
  #Determine which features to include by finding only those that include "mean() or std() but not 
  #meanFreq()
  #Subset the data, and ensure columns are named properly  
  features <- read.table(paste(tmpdir,"/UCI HAR Dataset/features.txt",sep=""))
  colToKeep <-c(grepl(paste(c("mean()","std()"), collapse='|'), features[,2]) &
                  !grepl("meanFreq()", features[,2]),TRUE,TRUE)
  MeanStd<-subset(data,select = colToKeep)
  Names<-c(as.character(features[,2]),"Activity","Subject")
  colnames(MeanStd)<-c(Names[colToKeep])
  MeanStd
}
AddActivities<-function(tmpdir,data){
  #Add activity names to dataset by merging on Activities column; 
  #remove original activities number column and rename new named activities column properly
  activities <- read.table(paste(tmpdir,"/UCI HAR Dataset/activity_labels.txt",sep=""))
  Data_Activities<-merge(data,activities,by.x = "Activity",by.y="V1")
  Data_Activities[,1]<-NULL
  colnames(Data_Activities)[length(Data_Activities)]<-"Activity"
  Data_Activities
}
CreateTable<- function(tmpdir,data){
  #Runs SubsetData, AddActivities and create table of average measure by subject and activity
  #Write table to drive
  SubsetData <-SubsetData(tmpdir,data)
  AllData<-AddActivities(tmpdir,SubsetData)
  Molten <- melt(AllData, id.vars = c("Subject", "Activity"))
  MeanData_SubAct<-dcast(Subject + Activity ~ variable, data = Molten, fun = mean)
  write.table(MeanData_SubAct,"MeanData_SubjectActivity.txt",sep="\t",col.names = TRUE, row.names = FALSE)
}


#Sets temporary directory to the contents of the zipped file
tmpdir<-TempDir("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#Reads in the test and training data and combines
testTrain<-ReadData(tmpdir)

#Calls functions to subsets data into only the mean and standard deviation data and combines data
#in Activities. Finally, caluclates the means using melt and dcast from reshape and writes
#Table of means
CreateTable(tmpdir, testTrain)
