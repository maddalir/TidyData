#Getting and Cleaning Data Course Project

##Final Submission

This submission is a project encompassing the compaction, modification, aggregation and cleaning of the Human Activity Recognition Using Smartphones Dataset (HAR).

On the HAR dataset the following actions are  performed:
- Activity Labels from the HAR data set file activity_ables.txt have transposed into each row on the HAR data set measurements.
- Test and Train data sets have been merged and the rows marked as TEST and TRAIN respectively under the column STAGE.
- Variables on the feature vector that Computed mean() and std() have been selected into this limited data set. The columns have then been renamed using an algorithm that is derived 
- The mean of each selected column is then computed and written to a data file called tidy_data.txt
- An R script file cleanData.R. The processData

## Project Files

- README.md

- run_analysis.R

