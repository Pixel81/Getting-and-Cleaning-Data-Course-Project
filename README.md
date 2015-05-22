# Getting-and-Cleaning-Data-Course-Project
Course project for the third module on Data scientist courses

## Course project objective
Create one R script called **run_analysis.R** that does the following 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How it works
1. Download the data source (.zip) in your working directory.
2. Unzip the file in your working director. A **UCI HAR Dataset** folder is created.
3. Copy the **run_analysis.R** file in your working directory.
4. Run the code source("run_analysis.R"). !! See Dependencies section
A file called **tidy_data.txt** is generated in your working directory.
5. If you want to check the file created, execute the following code in R

    data <- read.table("./tidy_data.txt", header = TRUE)
 View(data)

## Dependencies
In order to work properly, you need to install and load in R **reshape2** and **data.table** packages.