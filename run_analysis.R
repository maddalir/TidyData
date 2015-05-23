## An internal function to parse Activity column names and 
## generate more meaningful column names based on the parsed Activity Tokens
newColName <- function(currString) {
  newName <- ""
  
  ### Time or Frequency
  if (substr(currString,1,1) == "t")
    newName <- paste(newName,"Time",sep="")
  else
    newName <- paste(newName,"Freq",sep="")
  
  ### Body or Gravity
  result_Body <- grep("Body",currString,value=TRUE)
  result_Gravity <- grep("Gravity",currString,value=TRUE)
  
  if (length(result_Body))
    newName <- paste(newName,"Body",sep=".")
  if (length(result_Gravity))
    newName <- paste(newName,"Gravity",sep=".")
  ### Acc or Gyro
  result_Acc <- grep("Acc",currString,value=TRUE)
  result_Gyro <- grep("Gyro",currString,value=TRUE)
    
  if (length(result_Acc))
    newName <- paste(newName,"Acc",sep=".")
  
  if (length(result_Gyro))
    newName <- paste(newName,"Gyro",sep=".")

  ### Jerk
  result_Jerk <- grep("Jerk",currString)
  if (length(result_Jerk))
    newName <- paste(newName,"Jerk",sep=".")

  ### Magnitude or Signal
  result_Mag <- grep("Mag",currString,value=TRUE)
  result_XYZ <- grep("[X|Y|Z]",currString,value=TRUE) 
  #print(result_XYZ)
  if (length(result_Mag))
    newName <- paste(newName,"Magnitude",sep=".")
  else if (length(result_XYZ)!=0) {	
    newName <- paste(newName,"Signal",sep=".")
    XYZ_Char <- substr(currString,nchar(currString),nchar(currString))
    newName <- paste(newName,XYZ_Char,sep=".")
  }  
  
  
  
  

  ### Body or Gravity
  result_Mean <- grep("mean",currString,value=TRUE)
  result_Std  <- grep("std",currString,value=TRUE)
  if (length(result_Mean))
    newName <- paste(newName,"Mean",sep=".")
  if (length(result_Std))
    newName <- paste(newName,"Std",sep=".")
  
  newName   
}

processData <- function() {
  ## Set base wd
  setwd("/Users/rajmaddali/Desktop/Coursera/cleaningdata/Activity")
  
  # These vars are used in the testing phase. Setting them to -1 removes testing
  nrows_val=-1
  ncols_val=-1
  
  ### Read Activity Labels
  activity_labels <- read.table("activity_labels.txt",nrows=nrows_val)
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
  
  ### Assign column names
  x_cull_test  <- x_test[,subset_cols]
  x_cull_train <- x_train[,subset_cols]
  colnames(x_cull_test) <- new_names
  colnames(x_cull_train) <- new_names
  message("Complete culling x_test and train data") 
  
  ### Need to attach label “TEST” and “TRAIN” to each 
  y_test$Data.Stage = 'Test'
  y_train$Data.Stage = 'Train'
  message("Complete Adding STAGE columns to test and train data") 
  
  ### Merge Activity Labels with Test and Train 
  test_merge <- cbind(y_test,x_cull_test)
  train_merge <- cbind(y_train,x_cull_train)
  message("Complete merging Activity labels with  x_test and train data")   
  
  ### Activity Labels for Activity Cols 
  test_merge_labels <- merge(activity_labels,test_merge,by="Activity",all=FALSE)
  train_merge_labels <- merge(activity_labels,train_merge,by="Activity",all=FALSE)  

  ### Dump Colnames
  col_length <- length(colnames(test_merge_labels))
  new_subset_cols_names = c("Activity","Activity.Description","Data.Stage",subset_cols_names)
  allNames <- cat(paste("\t",1:col_length,"\t\t",new_subset_cols_names,"\t\t\t",colnames(test_merge_labels),"\n"))
  ### Merge two datasets
  all_merge <- rbind(test_merge_labels,train_merge_labels)

  #install.packages("dplyr")
  library(data.table)
  library(dplyr)
  message("Pre Clean")
  message(dim(all_merge))
  all_merge_dt = data.table(all_merge)
  all_merge_dt[which(all_merge_dt==Inf)] = NA
  all_filter <- filter(all_merge_dt,complete.cases(all_merge_dt))
  message("Post Clean")
  message(dim(all_filter))
  
  result <- ddply(all_filter,.(Data.Stage,Activity.Description), numcolwise(mean))  
  
  setwd("~/GitHub/TidyData")
  result=write.table(result,"tidyset.txt",row.name=FALSE)
}