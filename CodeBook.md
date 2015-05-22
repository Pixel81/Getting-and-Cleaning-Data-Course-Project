# CodeBook

This code book describes variables, data, and transformations or work that you performed to clean up the data.

## Data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data

The dataset includes the following files:

* 'README.txt': Description file of the experimentation.
* 'features_info.txt': Information about all features variables avaible in the test and train forlders.
* 'features.txt': List of all features available in X_test and X_train files.
* 'activity_labels.txt': List of code and name activity (6 activities)

Then two folders, 'train' and 'test', with the same organisation. The population is about 30 people divided in two classes : train and test.

Description of the 'train' files folder

* 'train/X_train.txt': Training set for all features.
* 'train/y_train.txt': Labels of the training set.
* 'train/subject_train.txt': Subject for each activity in the training set.

In each 'train' and 'test' folder, an 'Inertial Signals' folder with 9 similar files (not used in our analysis)
* 'train/Inertial Signals/total_acc_x_train.txt': Acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

The 'test' files, not developped here, ar equal to 'train' one, but on the 'test' population.

## Transformation
### Files need to be unzip in the working directory

1. Merges the training and the test sets to create one data set
1.1 Load x_test, y_test and subject files
* Combine x, y and subject test data
* Add a Population column to identify test data
  
1.2 Load x_test, y_test and subject files
* Combine x, y and subject train data
* Add a Population column to identify train data
		
1.3 Combine train & test data

2. Extracts only the measurements on the mean and standard deviation for each measurements

2.1 Load features data
        
2.2 Filter only mean & standard column on features
* Filter on mean & std value in features values
* Add 2 TRUE values to the extract logical stream to save 'y' value and 'Population' value

2.3 Filter the data_set on extract_features
       
3. Uses descriptive activity names to name the activities in the data set
3.1 Load activity labels
3.2 Apply activity labels on data_set
        
4. Appropriately labels the data set with descriptive variable names
4.1 Filter features titles on mean & std values
4.2 Apply features names on data_extract
        
5. From step-4, creates a second, independant tidy data set with the average of each variable for each activity     
5.1. Melt data into final form order
5.2 Creation of the tidy_data set applying mean
5.3 Write tidy_data into a txt file in the working directory
