##################
## Name: run_analysis.R
## Author: RHorth
## Date: 06/05/2016
## Output file produced: UCI_HAR_means_codebook.txt
##################

###############
#### Step 1. Set working directory and load libraries
###############

# Change the location of this folder to the folder containing the UCI HAR Dataset
setwd("C:/UCI HAR Dataset/")

# Load in libraries used
library(plyr)
library(memisc)

###############
#### Step 2. Read in files
###############

#2.A. Read in label text files
features <- read.table("features.txt") # column names for xtest file
activity <- read.table("activity_labels.txt") # reads in activity labels

#2.B. Read in test text files
xtest <- read.table("test/X_test.txt") # xtest data
ytest <- read.table("test/y_test.txt") # activity 
sbjtest <- read.table("test/subject_test.txt")

#2.C. Read in train test files
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
sbjtrain <- read.table("train/subject_train.txt")

###############
#### Step 3. Clean up train and test files and create one dataset for each
###############

# 3.A. Add column label to subject id data
colnames(sbjtrain) <- "subjectid"
colnames(sbjtest) <- "subjectid"

# 3.B. Add column labels to measurements data
# and retain only the variables with mean and std
colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2
xtrain <- xtrain[ , grep("*mean*|*std*",colnames(xtrain))]
xtest <- xtest[ , grep("*mean*|*std*",colnames(xtest))]
#
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
#### Step 4. Merge the cleaned test and train datasets
###############

# 4.A. Merge the test and train datasets
# Since the participant id's are different for each dataset
# And the row names are the same, then can just rbind the datasets
df <- rbind(test, train)

###############
#### Step 5. Create a new tidy dataset with mean of numeric columns and relabeled variable 
###############

# 5.A. Use the ddply function to apply mean across the numeric columns
df$subjectid <- as.factor(df$subjectid)
tidydf <- ddply(df, .(subjectid, activity), colwise(mean, is.numeric))

# 5.B Rename variables
names(tidydf) <- gsub("-","",names(tidydf))
names(tidydf) <- gsub("\\()","",names(tidydf))
names(tidydf) <- gsub("^t","Time",names(tidydf))
names(tidydf) <- gsub("^f","Freq",names(tidydf))
names(tidydf)[3:ncol(tidydf)] <- paste("Mean", names(tidydf)[3:ncol(tidydf)], sep="")

# 5.C. Write out the dataset to a new text dataset
write.table(tidydf, "UCI_HAR_means.txt", row.name=F)

# 5.D Write out a codebook for the dataset
#Write(codebook(tidydf), file="UCI_HAR_means_codebook.txt")