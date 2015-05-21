newColName <- function(currString) {
  #print(currString)
  newName <- "currString - "
  
  ### Magnitude or Signal
  result_Mag <- grep("Mag",currString,value=TRUE)
  result_XYZ <- grep("[X|Y|Z]",currString,value=TRUE) 
  #print(result_XYZ)
  if (length(result_Mag))
    newName <- paste(newName,"Magnitude")
  else if (length(result_XYZ)!=0) {	
    newName <- paste(newName,"Signal")
    XYZ_Char <- substr(currString,nchar(currString),nchar(currString))
    newName <- paste(newName,XYZ_Char)
  }  
  
  ### Jerk
  result_Jerk <- grep("Jerk",currString)
  if (length(result_Jerk))
    newName <- paste(newName,"Jerk")
  
  ### Acc or Gyro
  result_Acc <- grep("Acc",currString,value=TRUE)
  result_Gyro <- grep("Gyro",currString,value=TRUE)
    
  if (length(result_Acc))
    newName <- paste(newName,"Acc")
  
  if (length(result_Gyro))
    newName <- paste(newName,"Gyro")
  
  ### Body or Gravity
  result_Body <- grep("Body",currString,value=TRUE)
  result_Gravity <- grep("Gravity",currString,value=TRUE)
  
  if (length(result_Body))
    newName <- paste(newName,"Body")
  if (length(result_Gravity))
    newName <- paste(newName,"Gravity")
  
  if (substr(currString,1,1) == "t")
    newName <- paste(newName,"Time")
  else
    newName <- paste(newName,"Freq")

  ### Body or Gravity
  result_Mean <- grep("mean",currString,value=TRUE)
  result_Std  <- grep("std",currString,value=TRUE)
  if (length(result_Mean))
    newName <- paste(newName,"Mean")
  if (length(result_Std))
    newName <- paste(newName,"Std")
  
  newName   
}

processData <- function() {
  ## Set base wd
  setwd("/Users/rajmaddali/Desktop/Coursera/cleaningdata/Activity")
  
  nrows_val=-1
  ncols_val=-1
  ### Read Activity Labels
  activity_labels <- read.table("activity_labels.txt",nrows=nrows_val)
  ##str(activity_labels)
  colnames(activity_labels)[1] <- "Activity"
  colnames(activity_labels)[2] <- "Activity.Description"
  message("Complete Creating Activity Labels data")
  
  x_test <- read.table("test/X_test.txt",nrows=nrows_val)
  x_train <- read.table("train/X_train.txt",nrows=nrows_val)
  message("Complete Reading X_test and X_train dta")
  
  y_test <- read.table("test/y_test.txt",nrows=nrows_val)
  y_train <- read.table("train/y_train.txt",nrows=nrows_val)
  message("Complete Reading Y_test and Y_train dta")
  
  ### Rename Column Name in Activity Labels
  colnames(y_test)[1] <- "Activity"
  colnames(y_train)[1] <- "Activity"
  message("Add Activity Col name to Activity Data")
  
  ### Read Features
  features <- read.table("features.txt",nrows=ncols_val)
  message("Complete Reading features data") 
  
  ### Subset of Columns we need to pluck out
  mean_std_features <- features[grep("mean\\(\\)|std\\(\\)",features$V2),c(1,2)]
  message("Complete parsing features data") 
  
  ### Columns Chosen
  subset_cols <- mean_std_features[,1]
  subset_cols_names <- as.character(mean_std_features[,2])
  message("Complete subsetting features data") 
  new_names <- sapply(subset_cols_names,function(x) newColName(x))
  
  x_cull_test  <- x_test[,subset_cols]
  x_cull_train <- x_train[,subset_cols]
  colnames(x_cull_test) <- new_names
  colnames(x_cull_train) <- new_names
  message("Complete culling x_test and train data") 
  #print(x_cull_test)
  #print(y_test)
  ### Merge Activity Labels with Test and Train 
  test_merge <- cbind(x_cull_test,y_test)
  train_merge <- cbind(x_cull_train,y_train)
  message("Complete merging Activity lables with  x_test and train data") 
  #print(test_merge)
  
  ### Need to attach label “TEST” and “TRAIN” to each 
  test_merge$STAGE = 'TEST'
  train_merge$STAGE = 'TRAIN'
  message("Complete Adding STAGE columns to test and train data") 
  
  ### Activity Labels for Activity Cols 
  test_merge_labels <- merge(test_merge,activity_labels,by="Activity",all=FALSE)
  train_merge_labels <- merge(train_merge,activity_labels,by="Activity",all=FALSE)  
  #print(str(test_merge_labels))
  #print(str(train_merge_labels))

  ### Merge two datasets
  all_merge <- rbind(test_merge_labels,train_merge_labels)
  all_merge
  #install.packages("dplyr")
  #library(dplyr)
  #grp <- group_by(all_merge,STAGE)
  #summarise(grp,mean=mean(c(2)),sd=sd(c(2))
  #http://stats.stackexchange.com/questions/8225/how-to-summarize-data-by-group-in-r
            
  #ddply(result,.(STAGE,Activity.Description),summarise, colwise(mean)
  #ddply(result,.(STAGE,Activity.Description), numcolwise(mean))                

  ### Move inf to NA
}