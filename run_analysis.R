run_analysis <- {
      library(dplyr) 
      library(tidyr) 
      ##Loads dplyr and tidyr packages
      subject_train <- read.table("train/subject_train.txt", col.names="Subject")
      activity_train <- read.table("train/y_train.txt", col.names="Activity")
      obs_train <- read.table("train/X_train.txt")
      subject_test <- read.table("test/subject_test.txt", col.names="Subject")
      activity_test <- read.table("test/y_test.txt", col.names="Activity")
      obs_test <- read.table("test/X_test.txt")
      ##Reads in necessary data files from the "train" and "test" folders as data frames
      obs_train_extract <- obs_train[ , c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
      obs_test_extract <- obs_test[ , c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
      ##Extracts relevant columns for means and standard deviations of measurements
      all_train <- cbind (subject_train, activity_train, obs_train_extract)
      all_test <- cbind(subject_test, activity_test, obs_test_extract)
      all_data <- rbind(all_test, all_train)
      ##Merges all data files into a single data set
      colnames(all_data) <- c("Subject", "Activity", "Time.Body.Accelerometer.Mean.X-axis", "Time.Body.Accelerometer.Mean.Y-axis", "Time.Body.Accelerometer.Mean.Z-axis", "Time.Body.Accelerometer.StanDev.X-axis", "Time.Body.Accelerometer.StanDev.Y-axis", "Time.Body.Accelerometer.StanDev.Z-axis", "Time.Gravity.Accelerometer.Mean.X-axis", "Time.Gravity.Accelerometer.Mean.Y-axis", "Time.Gravity.Accelerometer.Mean.Z-axis", "Time.Gravity.Accelerometer.StanDev.X-axis", "Time.Gravity.Accelerometer.StanDev.Y-axis", "Time.Gravity.Accelerometer.StanDev.Z-axis", "Time.Body.Accelerometer.Jerk.Mean.X-axis", "Time.Body.Accelerometer.Jerk.Mean.Y-axis", "Time.Body.Accelerometer.Jerk.Mean.Z-axis", "Time.Body.Accelerometer.Jerk.StanDev.X-axis", "Time.Body.Accelerometer.Jerk.StanDev.Y-axis", "Time.Body.Accelerometer.Jerk.StanDev.Z-axis", "Time.Body.Gyroscope.Mean.X-axis", "Time.Body.Gyroscope.Mean.Y-axis", "Time.Body.Gyroscope.Mean.Z-axis", "Time.Body.Gyroscope.StanDev.X-axis", "Time.Body.Gyroscope.StanDev.Y-axis", "Time.Body.Gyroscope.StanDev.Z-axis", "Time.Body.Gyroscope.Jerk.Mean.X-axis", "Time.Body.Gyroscope.Jerk.Mean.Y-axis", "Time.Body.Gyroscope.Jerk.Mean.Z-axis", "Time.Body.Gyroscope.Jerk.StanDev.X-axis", "Time.Body.Gyroscope.Jerk.StanDev.Y-axis", "Time.Body.Gyroscope.Jerk.StanDev.Z-axis", "Time.Body.Accelerometer.Magnitude.Mean", "Time.Body.Accelerometer.Magnitude.StanDev", "Time.Gravity.Accelerometer.Magnitude.Mean", "Time.Gravity.Accelerometer.Magnitude.StanDev", "Time.Body.Accelerometer.Jerk.Magnitude.Mean", "Time.Body.Accelerometer.Jerk.Magnitude.StanDev", "Time.Body.Gyroscope.Magnitude.Mean", "Time.Body.Gyroscope.Magnitude.StanDev", "Time.Body.Gyroscope.Jerk.Magnitude.Mean", "Time.Body.Gyroscope.Jerk.Magnitude.StanDev", "Frequency.Body.Accelerometer.Mean.X-axis", "Frequency.Body.Accelerometer.Mean.Y-axis", "Frequency.Body.Accelerometer.Mean.Z-axis", "Frequency.Body.Accelerometer.StanDev.X-axis", "Frequency.Body.Accelerometer.StanDev.Y-axis", "Frequency.Body.Accelerometer.StanDev.Z-axis", "Frequency.Body.Accelerometer.Jerk.Mean.X-axis", "Frequency.Body.Accelerometer.Jerk.Mean.Y-axis", "Frequency.Body.Accelerometer.Jerk.Mean.Z-axis", "Frequency.Body.Accelerometer.Jerk.StanDev.X-axis", "Frequency.Body.Accelerometer.Jerk.StanDev.Y-axis", "Frequency.Body.Accelerometer.Jerk.StanDev.Z-axis", "Frequency.Body.Gyroscope.Mean.X-axis", "Frequency.Body.Gyroscope.Mean.Y-axis", "Frequency.Body.Gyroscope.Mean.Z-axis", "Frequency.Body.Gyroscope.StanDev.X-axis", "Frequency.Body.Gyroscope.StanDev.Y-axis", "Frequency.Body.Gyroscope.StanDev.Z-axis", "Frequency.Body.Accelerometer.Magnitude.Mean", "Frequency.Body.Accelerometer.Magnitude.StanDev", "Frequency.Body.Accelerometer.Jerk.Magnitude.Mean", "Frequency.Body.Accelerometer.Jerk.Magnitude.StanDev", "Frequency.Body.Gyroscope.Magnitude.Mean", "Frequency.Body.Gyroscope.Magnitude.StanDev", "Frequency.Body.Gyroscope.Jerk.Magnitude.Mean", "Frequency.Body.Gyroscope.Jerk.Magnitude.StanDev")
      ##Adds descriptive variable names as column headings
      activity_list <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
      all_data <- mutate(all_data, Activity=activity_list[Activity])
      ##Transforms numeric Activity values into descriptive names
      tidy_set <- aggregate(all_data[ ,3:68], list(all_data$Subject, all_data$Activity), mean)
      ##Generates tidy data set with mean measurement values for each unique combination of Subject and Activity 
      colnames(tidy_set)[1:2] <- c("Subject", "Activity")
      ##Fixes column labels in tidy data set 
      tidy_set <- arrange(tidy_set, Subject, Activity)
      ##Sorts data by Subject and then by Activity
}