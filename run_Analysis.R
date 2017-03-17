#' ###### Create index of variables
#' 
#' 1. Read in the features of the dataset (variable names)
#' 2. Filter out only the variables which are the mean or standard
#'    deviation
#' 3. Create the index of these

features <- read.table(file = "UCI HAR Dataset/features.txt")
ft_index <- grep("(mean\\(\\)|std\\(\\))", features$V2)
features <- features[ft_index,]
colnames(features) <- c("colIndex", "variableName")
features$variableName <- gsub("-mean\\(\\)", "Mean", 
                              features$variableName)
features$variableName <- gsub("-std\\(\\)", "StdDev", 
                              features$variableName)
features$variableName <- gsub("-", "", features$variableName)
rm(ft_index)

#' ###### Load the data from the test and train sets
#' 
#' 1. For each set, load in the X, Y and subject data
#' 2. Remove the variables we are not interested in each X set
#' 3. Merge the subject, Y and X data in that order to one set
#' 4. Merge the trn data and tst data together into one big data frame
#' 5. Remove unneeded objects

tst_x <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
tst_y <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
tst_sub <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
tst_x <- tst_x[, features$colIndex]
tst_data <- cbind(tst_sub, tst_y, tst_x)
rm(tst_x, tst_y, tst_sub)

trn_x <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
trn_y <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
trn_sub <- read.table(file = 
                          "UCI HAR Dataset/train/subject_train.txt")
trn_x <- trn_x[, features$colIndex]
trn_data <- cbind(trn_sub, trn_y, trn_x)
rm(trn_x, trn_y, trn_sub)

filtdata <- rbind(tst_data, trn_data)

rm(tst_data, trn_data)

#' ###### Set dataframe structure
#' 
#' Clean up the names of the Activity values

activity <- read.table(file = "UCI HAR Dataset/activity_labels.txt", 
                       colClasses = c(V2 = "character"))
activity$V2 <- tolower(activity$V2)
activity$V2 <- gsub("_", "", activity$V2)
colnames(activity) <- c("id","activityName")

#' Setup Variable Names

varNames <- c("subject", "activityName", features$variableName)
colnames(filtdata) <- varNames

#' Setup subjects and activity as factors
filtdata$subject <- as.factor(filtdata$subject)
filtdata$activityName <- as.factor(filtdata$activityName)

#' Remove unneeded objects

rm(activity, features, varNames)
