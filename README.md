Description for run_Analysis.R
========================================================

Part I: Overview
-------------------------
1. Calls TempDir to Unzips file into a temporary folder
2. Calls ReadData to reads in necessary files and merge:
  * X_test
  * X_train
  * Y_test
  * Y_train
  * Subject_test
  * Subejct_train
  
2. Calls CreateTable:
  * Calls SubsetData to select only mean() and std() columns
  * Calls AddActivities to replace activity indicator number with activity name
  * Determines mean for each subject for each activity
  * Writes the table

Part II: Functions to process data
-------------------------
1. TempDir:
  * Accepts url of data
  * Creates a temporary directory of the holdings of the zip file
  * Returns string of the name of the directory

2. ReadData:
  * Accepts charcter of directory location as input
  * Opens testing and training datasets and combines
  * Return dataframe
      * Rows including data from: 
          * Test Data
          * Train Data
      * Columns of
          * Factors
          * Label
          * Subject
3. SubsetData:
  * Accepts character of directory location, dataframe as inputs
  * Opens Features map, determines which features to include based on name and subsets dataframe
  * Returns dataframe of only mean and standard deviation features with proper labels

4. AddActivies:
  * Accepts character of directory location, dataframe as inputs
  * Opens Activities map, merges dataframe with activities map
  * Returns dataframe with Activities names given rather than activies number
  
5. CreateTable:
  * Accepts character of directory location, dataframe as inputs
  * Runs SubsetData to return proper subset
  * Runs AddActivities to replace activity number with names
  * Creates table of average feature by subject and activities
  * Writes table to MeanData_SubjectActivity.txt