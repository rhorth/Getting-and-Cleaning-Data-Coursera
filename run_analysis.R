###############
#### 1. Set working directory and load libraries
###############

# Change the location of this folder to the folder containing the UCI HAR Dataset
setwd("C:/UCI HAR Dataset/")

# Load in libraries used
library(plyr)
library(memisc)

###############
#### 2. Read in files
###############

#2.A. Read in label text files
features <- read.table("features.txt") # column names for xtest file
activity <- read.table("activity_labels.txt") # reads in activity labels

#2.B. Read in test text files
xtest <- read.table("test/X_test.txt") # xtest data
ytest <- read.table("test/y_test.txt") # activity 
sbjtest <- read.table("test/subject_test.txt")
#accx <- read.table("test/Inertial Signals/body_acc_x_test.txt")
#accy <- read.table("test/Inertial Signals/body_acc_y_test.txt")
#accz <- read.table("test/Inertial Signals/body_acc_z_test.txt")
#gyrox <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
#gyroy <- read.table("test/Inertial Signals/body_gyro_y_test.txt")
#gyroz <- read.table("test/Inertial Signals/body_gyro_z_test.txt")
#totaccx <- read.table("test/Inertial Signals/total_acc_x_test.txt")
#totaccy <- read.table("test/Inertial Signals/total_acc_y_test.txt")
#totaccz <- read.table("test/Inertial Signals/total_acc_z_test.txt")

#2.C. read in train test files
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
sbjtrain <- read.table("train/subject_train.txt")

###############
#### 3. Clean up train and test files and create one dataset for each
###############

# 3.A. Add column label to subject id data
colnames(sbjtrain) <- "subject_id"
colnames(sbjtest) <- "subject_id"

# 3.B. Add column labels to measurements data
# and retain only the variables with mean and std
colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2
xtrain <- xtrain[ , grep("*mean*|*std*",colnames(xtrain))]
xtrain <- xtrain[ , !grepl("*meanFreq*",colnames(xtrain))]
xtest <- xtest[ , grep("*mean*|*std*",colnames(xtest))]
xtest <- xtest[ , !grepl("*meanFreq*",colnames(xtest))]

# 3.C. Merge the subject, the activity and the measurements data
train <- as.data.frame(cbind(sbjtrain, ytrain, xtrain))
test <- as.data.frame(cbind(sbjtest, ytest, xtest))

# 3.D. Add activity names to activities data
test <- merge(test, activity, by="V1", all.x=T)
test <- rename(test, c("V2" = "activity"))
test$V1 <- NULL
train <- merge(train, activity, by="V1", all.x=T)
train <- rename(train, c("V2" = "activity"))
train$V1 <- NULL

###############
#### 4. Merge the cleaned test and train datasets
###############

# 4.A. Merge the test and train datasets
# Since the participant id's are different for each dataset
# And the row names are the same, then can just rbind the datasets
df <- rbind(test, train)

###############
#### 5. Creat a new tidy dataset with mean 
###############

# 5.A. Use the ddply function to apply mean across the numeric columns
df$subject_id <- as.factor(df$subject_id)
tidydf <- ddply(df, .(subject_id, activity), colwise(mean, is.numeric))

# 5.B. Write out the dataset to a new text dataset
write.table(tidydf, "UCI_HAR_mean_summary.txt", row.name=F)

# 5.C Write out a codebook for the dataset
Write(codebook(tidydf), file="UCI_HAR_mean.txt")