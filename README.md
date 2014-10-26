Generating a Tidy Dataset with Selected Variables from 'Human Activity Recognition Using Smartphones' Dataset
==================

The R script "run_analysis.R" merges, extracts, and transforms selected variables from the human activity data collected by Reyes-Ortiz, Anguita, Ghio, and Oneto to create a tidy data set summarizing those variables. The original data include 561 measurements taken from accelerometer and gyroscope signals from Samsung Galaxy S II smartphones recording the movements of 30 human subjects performing six types of activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying). The tidy dataset ("tidy_set") produced by the script contains the mean value of 66 of the original 561 activity measurements for each human subject ("Subject") performing each of the six activities ("Activity").  
  
The "run_analysis.R" script requires that the R packages "dplyr" and "tidyr" be installed. The script will load the installed packages.   

### 1. Merging data from 'Test' and 'Train' subject groups into a single dataset  
The raw data from Reyes-Ortiz, Anguita, Ghio, and Oneto was stored in six data files —- three files for each of two groups of subjects (the "test" and "train" groups). Each group includes a file containing unique identifiers for each human subject, a file containing numeric codes representing each of the six activities measured, and a file containing values for the 561 smartphone measurements collected.  
  
The "run_analysis.R" script uses the "read.tables()" function to read each of these six data files into R and assign object names to the six resulting data frames ("subject_test", "subject_train", "activity_test", "activity_train", "obs_test", and "obs_train"). It uses the "rbind()" and "cbind()" functions to combine the six separate data frames into a single data frame ("all_data").  

### 2. Extracting selected variables containing mean and standard deviation of activity measurements  
Before the six original data frames are combined into a single data frame, the two frames containing the values for the 561 measurements ("obs_test" and "obs_train") are subsetted to include only the columns containing mean and standard deviation values for feature vectors estimated from the smartphone signals.  

### 3. Adding descriptive activity names to the Activity variable  
The script uses the "mutate()" function to replace the numeric codes in the Activity column of "all_data" with character values describing the six activities covered by the data ("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", and "Laying").  

### 4. Labeling dataset with descriptive variable names  
The script uses the "colnames()" function to add variable names to "all_data" that describe the content of each variable. The Subject column contains the unique identifiers for the 30 subjects in the dataset. The Activity column contains the label identifying the activity the subjects were performing when measurements were taken. The remaining 66 columns have variable names that describe the type of measurement taken from the smartphone signals of each Subject for each Activity. The Codebook.md file describes the variables in these columns in more detail.  

### 5. Calculating the average (mean) of measurement variables for each unique combination of Subject and Activity and storing the results in a new, tidy dataset  
The script uses the "aggregate()" function to calculate the average (mean) value for each of the 66 activity measurements for each unique combination of Subject and Activity. The resulting mean values are stored in the new dataset, "tidy_set".  
  
Finally, the "colnames()" and "arrange()" functions are used to replace the Subject and Activity column headings that were overwritten following execution of the "aggregate()" function and to sort the 180 observations in "tidy_data" by Subject and then by Activity.   