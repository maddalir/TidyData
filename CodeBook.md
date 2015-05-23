The Human Activity Recognition Using Smartphones Dataset (HAR) is modified and presented in a summarized fashion.

# Data 

# Data Groupings
	- Activity - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
	- Data.Stage - Test and  Train

# Data Variable Description (Columns)

	- Columns 1,2,3 represent Data Groupings
	- Columns 4-49 represent the mean value of original activities

	Col		 Original Activity (HAR)		Data Grouping Columns
	

	 1 		 Activity 			 	 Activity 
 	 2 		 Activity.Description 			 Activity.Description 
 	 3 		 Data.Stage 			 	 Data.Stage 

	Col		 Original Activity (HAR)		Mean Value Columns

 	 4 		 tBodyAcc-mean()-X 			 Time.Body.Acc.Signal.X.Mean 
 	 5 		 tBodyAcc-mean()-Y 			 Time.Body.Acc.Signal.Y.Mean 
 	 6 		 tBodyAcc-mean()-Z 			 Time.Body.Acc.Signal.Z.Mean 
 	 7 		 tBodyAcc-std()-X 			 Time.Body.Acc.Signal.X.Std 
 	 8 		 tBodyAcc-std()-Y 			 Time.Body.Acc.Signal.Y.Std 
 	 9 		 tBodyAcc-std()-Z 			 Time.Body.Acc.Signal.Z.Std 
 	 10 		 tGravityAcc-mean()-X 			 Time.Gravity.Acc.Signal.X.Mean 
 	 11 		 tGravityAcc-mean()-Y 			 Time.Gravity.Acc.Signal.Y.Mean 
 	 12 		 tGravityAcc-mean()-Z 			 Time.Gravity.Acc.Signal.Z.Mean 
 	 13 		 tGravityAcc-std()-X 			 Time.Gravity.Acc.Signal.X.Std 
 	 14 		 tGravityAcc-std()-Y 			 Time.Gravity.Acc.Signal.Y.Std 
 	 15 		 tGravityAcc-std()-Z 			 Time.Gravity.Acc.Signal.Z.Std 
 	 16 		 tBodyAccJerk-mean()-X 			 Time.Body.Acc.Jerk.Signal.X.Mean 
 	 17 		 tBodyAccJerk-mean()-Y 			 Time.Body.Acc.Jerk.Signal.Y.Mean 
 	 18 		 tBodyAccJerk-mean()-Z 			 Time.Body.Acc.Jerk.Signal.Z.Mean 
 	 19 		 tBodyAccJerk-std()-X 			 Time.Body.Acc.Jerk.Signal.X.Std 
 	 20 		 tBodyAccJerk-std()-Y 			 Time.Body.Acc.Jerk.Signal.Y.Std 
 	 21 		 tBodyAccJerk-std()-Z 			 Time.Body.Acc.Jerk.Signal.Z.Std 
 	 22 		 tBodyGyro-mean()-X 			 Time.Body.Gyro.Signal.X.Mean 
 	 23 		 tBodyGyro-mean()-Y 			 Time.Body.Gyro.Signal.Y.Mean 
 	 24 		 tBodyGyro-mean()-Z 			 Time.Body.Gyro.Signal.Z.Mean 
 	 25 		 tBodyGyro-std()-X 			 Time.Body.Gyro.Signal.X.Std 
 	 26 		 tBodyGyro-std()-Y 			 Time.Body.Gyro.Signal.Y.Std 
 	 27 		 tBodyGyro-std()-Z 			 Time.Body.Gyro.Signal.Z.Std 
 	 28 		 tBodyGyroJerk-mean()-X 		 Time.Body.Gyro.Jerk.Signal.X.Mean 
 	 29 		 tBodyGyroJerk-mean()-Y 		 Time.Body.Gyro.Jerk.Signal.Y.Mean 
 	 30 		 tBodyGyroJerk-mean()-Z 		 Time.Body.Gyro.Jerk.Signal.Z.Mean 
 	 31 		 tBodyGyroJerk-std()-X 			 Time.Body.Gyro.Jerk.Signal.X.Std 
 	 32 		 tBodyGyroJerk-std()-Y 			 Time.Body.Gyro.Jerk.Signal.Y.Std 
 	 33 		 tBodyGyroJerk-std()-Z 			 Time.Body.Gyro.Jerk.Signal.Z.Std 
 	 34 		 tBodyAccMag-mean() 			 Time.Body.Acc.Magnitude.Mean 
 	 35 		 tBodyAccMag-std() 			 Time.Body.Acc.Magnitude.Std 
 	 36 		 tGravityAccMag-mean() 			 Time.Gravity.Acc.Magnitude.Mean 
 	 37 		 tGravityAccMag-std() 			 Time.Gravity.Acc.Magnitude.Std 
 	 38 		 tBodyAccJerkMag-mean() 		 Time.Body.Acc.Jerk.Magnitude.Mean 
 	 39 		 tBodyAccJerkMag-std() 			 Time.Body.Acc.Jerk.Magnitude.Std 
 	 40 		 tBodyGyroMag-mean() 			 Time.Body.Gyro.Magnitude.Mean 
 	 41 		 tBodyGyroMag-std() 			 Time.Body.Gyro.Magnitude.Std 
 	 42 		 tBodyGyroJerkMag-mean() 		 Time.Body.Gyro.Jerk.Magnitude.Mean 
 	 43 		 tBodyGyroJerkMag-std() 		 Time.Body.Gyro.Jerk.Magnitude.Std 
 	 44 		 fBodyAcc-mean()-X 			 Freq.Body.Acc.Signal.X.Mean 
 	 45 		 fBodyAcc-mean()-Y 			 Freq.Body.Acc.Signal.Y.Mean 
 	 46 		 fBodyAcc-mean()-Z 			 Freq.Body.Acc.Signal.Z.Mean 
 	 47 		 fBodyAcc-std()-X 			 Freq.Body.Acc.Signal.X.Std 
 	 48 		 fBodyAcc-std()-Y 			 Freq.Body.Acc.Signal.Y.Std 
 	 49 		 fBodyAcc-std()-Z 			 Freq.Body.Acc.Signal.Z.Std 
 	 50 		 fBodyAccJerk-mean()-X 			 Freq.Body.Acc.Jerk.Signal.X.Mean 
 	 51 		 fBodyAccJerk-mean()-Y 			 Freq.Body.Acc.Jerk.Signal.Y.Mean 
 	 52 		 fBodyAccJerk-mean()-Z 			 Freq.Body.Acc.Jerk.Signal.Z.Mean 
 	 53 		 fBodyAccJerk-std()-X 			 Freq.Body.Acc.Jerk.Signal.X.Std 
 	 54 		 fBodyAccJerk-std()-Y 			 Freq.Body.Acc.Jerk.Signal.Y.Std 
 	 55 		 fBodyAccJerk-std()-Z 			 Freq.Body.Acc.Jerk.Signal.Z.Std 
 	 56 		 fBodyGyro-mean()-X 			 Freq.Body.Gyro.Signal.X.Mean 
 	 57 		 fBodyGyro-mean()-Y 			 Freq.Body.Gyro.Signal.Y.Mean 
 	 58 		 fBodyGyro-mean()-Z 			 Freq.Body.Gyro.Signal.Z.Mean 
 	 59 		 fBodyGyro-std()-X 			 Freq.Body.Gyro.Signal.X.Std 
 	 60 		 fBodyGyro-std()-Y 			 Freq.Body.Gyro.Signal.Y.Std 
 	 61 		 fBodyGyro-std()-Z 			 Freq.Body.Gyro.Signal.Z.Std 
 	 62 		 fBodyAccMag-mean() 			 Freq.Body.Acc.Magnitude.Mean 
 	 63 		 fBodyAccMag-std() 			 Freq.Body.Acc.Magnitude.Std 
 	 64 		 fBodyBodyAccJerkMag-mean() 		 Freq.Body.Acc.Jerk.Magnitude.Mean 
 	 65 		 fBodyBodyAccJerkMag-std() 		 Freq.Body.Acc.Jerk.Magnitude.Std 
 	 66 		 fBodyBodyGyroMag-mean() 		 Freq.Body.Gyro.Magnitude.Mean 
 	 67 		 fBodyBodyGyroMag-std()			 Freq.Body.Gyro.Magnitude.Std 
 	 68 		 fBodyBodyGyroJerkMag-mean()		 Freq.Body.Gyro.Jerk.Magnitude.Mean 
 	 69 		 fBodyBodyGyroJerkMag-std()		 Freq.Body.Gyro.Jerk.Magnitude.Std 
