# Download file from given url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "~/FUCIdataset.zip")

# Extract the zip archive locally
unzip("~/FUCIdataset.zip", list = TRUE)
unzip("~/FUCIdataset.zip")

# Read in training set and variable names
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt")
datnames <- read.table("./UCI HAR Dataset/features.txt", sep = " ")

# Assign variable names to training set
names(trainset) <- datnames[[2]]

# Read in training labels
trainlab <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Read in activity labels
actlab <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Convert the training labels variable to a factor with levels
# corresponding to the activity labels
trainlab1 <- factor(trainlab[[1]], levels = as.character(actlab[[1]]), labels = as.character(actlab[[2]]))

# Create a data frame that combines the training set and the activity
# corresponding to each observation
trainset <- cbind(trainlab1, trainset)

# Rename factor variable that records the activity to "activity"
names(trainset)[1] <- "activity"

# Read in testing set
testset <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Assign variable names to testing set
names(testset) <- datnames[[2]]

# Read in testing labels
testlab <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Convert the testing labels variable to a factor with levels
# corresponding to the activity labels
testlab1 <- factor(testlab[[1]], levels = as.character(actlab[[1]]), labels = as.character(actlab[[2]]))

# Create a data frame that combines the testing set and the activity
# corresponding to each observation
testset <- cbind(testlab1, testset)

# Rename factor variable that records the activity to "activity"
names(testset)[1] <- "activity"

# Merge training set and testing set
newset <- rbind(trainset, testset)

# Extract only variables that record the mean and standard deviation
# of the measurements (excluding those that record the mean frequency)
extrset <- newset[, grep("*mean|*std", names(newset))]
extrset <- extrset[, grep("*meanFreq", names(extrset), invert = TRUE)]

# Create a data frame that combines the extracted variables and the 
# activity variable
extrset <- cbind(as.factor(newset$activity), extrset)
names(extrset)[1] <- "activity"

# Give descriptive names to the variables that are all lowercase
names(extrset) <- gsub("tBodyAcc", "timebodyacceleration", names(extrset))
names(extrset) <- gsub("tGravityAcc", "timegravityacceleration", names(extrset))
names(extrset) <- gsub("tBodyGyro", "timebodyorientation", names(extrset))
names(extrset) <- gsub("fBodyAcc", "frequencybodyacceleration", names(extrset))
names(extrset) <- gsub("fBodyGyro", "frequencybodyorientation", names(extrset))
names(extrset) <- gsub("fBodyBodyAcc", "frequencybodyacceleration", names(extrset))
names(extrset) <- gsub("fBodyBodyGyro", "frequencybodyorientation", names(extrset))
names(extrset) <- gsub("Mag", "magnitude", names(extrset))
names(extrset) <- gsub("std", "standardeviation", names(extrset))
names(extrset) <- gsub("\\()", "", names(extrset))
names(extrset) <- tolower(names(extrset))
extrset[[1]] <- as.factor(tolower(extrset[[1]]))

# Create tidy dataset that summarizes each variable by its mean for each of
# the six activities
tidyset <- (aggregate(. ~ activity, extrset, mean))

# write.table(tidyset, file = "tidyset.txt", row.names = FALSE)

