CodeBook
========================================================

Part I: Description of data
-------------------------
Original data from: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
via: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From the original data description:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

### Analysis:
The original data from Inertia Signals of test and train folders within zip file was used to calculated the preprocessed mean and standard deviations found in X_test and X_train of zip file.  The testing and training data was recombined, and for each activity done by each subject, the mean measurements are given.

PartII: Description of variables
-------------------------
Data contains the mean of the mean and standard deviation of following measurements where XYZ means the measurements are given in the X-, Y- and Z- directions:
 
 - Subject: Subject number
 - Activity: Name of activity for the mean
 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

For more information, and the raw data, please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Part III: Required Libraries
-------------------------
- reshape2

Part IV:
-------------------------

