# Script for Getting & cleaning course
# by Pixel - 2015.05.05

# Works with the Dataset.zip files
# Files need to be unzip in the working directory

# 1. Merges the training and the test sets to create one data set

        # 1.1 Load x_test, y_test and subject files
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        # Combine x, y and subject test data
        test_data <- cbind(X_test,y_test,subject_test)
        # Add a Population column to identify test data
        test_data$Population <- "Test"
        
        # 1.2 Load x_test, y_test and subject files
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        # Combine x, y and subject train data
        train_data <- cbind(X_train,y_train,subject_train)
        # Add a Population column to identify train data
        train_data$Population <- "Train"
        
        # 1.3 Combine train & test data
        data_set <- rbind(test_data,train_data)

# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurements

        # 2.1 Load features data
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        # 2.2 Filter only mean & standard column on features
        # Filter on mean & std value in features values
        extract_features <- grepl("mean|std", features[,2])
        # Add 2 TRUE values to the extract logical stream to save 
        # 'y' value and 'Population' value
        extract_features2 <- c(extract_features,TRUE,TRUE,TRUE)
        
        # 2.3 Filter the data_set on extract_features
        data_extract <- data_set[,extract_features2]
        
# 3. Uses descriptive activity names to name the activities in
#    the data set

        # 3.1 Load activity labels
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
        
        # 3.2 Apply activity labels on data_set
        data_extract$Activity <- activity_labels[data_extract[,80]]
        
# 4. Appropriately labels the data set with descriptive variable
#    names

        # 4.1 Filter features titles on mean & std values
        features_selected <- features[extract_features,2]
        
        # 4.2 Apply features names on data_extract
        names(data_extract) = features_selected
        names(data_extract)[80:83] = c("Activity_Code","Subject_Num",
                                       "Population","Activity_lbl")
        
# 5. From step-4, creates a second, independant tidy data set
#    with the average of each variable for each activity
        
        # 5.1. Melt data into final form order
        melt_data = melt(data_extract, id=c("Activity_Code","Activity_lbl",
                                            "Subject_Num","Population"),
                         measure.vars = features_selected)
        
        # 5.2 Creation of the tidy_data set applying mean
        tidy_data   = dcast(melt_data,
                            Subject_Num + Activity_lbl ~ variable,
                            mean)
        
        # 5.3 Write tidy_data into a file
        write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
