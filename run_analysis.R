# Script for Getting & cleaning course
# by Pixel - 2015.05.05

# Works with the Dataset.zip files
# Files need to be unzip in the working directory

# 1. Merges the training and the test sets to create one data set

        # 1.1 Load x_test & y_test files
        X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        
        # Combine x & y test data
        test_data <- cbind(X_test,y_test)
        
        # Add a Population column to identify test data
        test_data$Population <- "Test"
        
        # 1.2 Load x_test & y_test files
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        
        # Combine x & y train data
        train_data <- cbind(X_train,y_train)
        
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
        extract_features <- c(extract_features,TRUE,TRUE)
        
        # 2.3 Filter the data_set on extract_features
        data_extract <- data_set[,extract_features]
        
# 3. Uses descriptive activity names to name the activities in
#    the data set

# 4. Appropriately labels the data set with descriptive variable
#    names

# 5. From step-4, creates a second, independant tidy data set
#    with the average of each variable for each activity
