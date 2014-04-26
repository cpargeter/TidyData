library(reshape2)
source("Analysis_Functions.R")
#Download and unzip file to temporary directory, read in datasets and produce final

#Sets temporary directory to the contents of the zipped file
tmpdir<-TempDir("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#Reads in the test and training data and combines
testTrain<-ReadData(tmpdir)

#Subsets into only the mean and standard deviation data, combines data in Activities and write
#Table of means
CreateTable(tmpdir, testTrain)
