#Getting and Cleaning Data Course Project

This project encompases the compaction, modification, aggregation and cleaning of the Human Activity Recognition Using Smartphones Dataset (HAR).

## Data Set Selection

- Original Data was collected from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- Six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) were measured. 
_ More information of the trials are available at the HAR site https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- The following signals were captured for the following activities


  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag

- This data set is limited to the mean and std. deviation of the above signals

##Final Submission


On the HAR dataset the following actions are  performed:
- Activity Labels from the HAR data set file activity_lables.txt have transposed into each row on the HAR data set measurements.
- Test and Train data sets have been merged and the rows marked as TEST and TRAIN respectively under the column STAGE.
- Variables on the feature vector that Computed mean() and std() have been selected into this limited data set. The columns have then been renamed using an algorithm that is derived 
- The mean of each selected column is then computed and written to a data file called tidy_data.txt
- An R script file cleanData.R. The processData


## Requirements

- To exercise this script it should be copied to the HAR base directory.
- The tidy data set can be recreated by calling processData() within the script.
- The script requires that dplyr and data.table packages are preinstalled.

## Project Files

  1) README.md

  2) run_analysis.R - The script file use to generated the data set.
 
  3) CodeBook.md - A codebook for the data set. It describes the data variables collected (columns) and the different stages and Activity codes under which they were collected (row groupings).
