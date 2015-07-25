# Assign file name for each input file 

fxtest <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
fytest <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
fsubtest <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
fxtrain <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
fytrain <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
fsubtrain <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
ffeat <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"
factiv <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"

# Use read.table to read the input files 

xtest <- read.table(fxtest)
ytest <- read.table(fytest)
subtest <- read.table(fsubtest)
xtrain <- read.table(fxtrain)
ytrain <- read.table(fytrain)
subtrain <- read.table(fsubtrain)
feat <- read.table(ffeat)
activ <- read.table(factiv)


# Merge test and train data to create one dataset for Measurement, Subject and Activity respectively.  
xtestrain <- rbind(xtest,xtrain)         #  Measurement
subtestrain <- rbind(subtest,subtrain)   #  Subject
ytestrain <- rbind(ytest,ytrain)         #  Activity    


# Extracts only the measurements on mean() and std()
meanStdColumns <- grep("mean\\(\\)|std\\(\\)", feat$V2, value = FALSE)
meanStdColumnsNames <- grep("mean\\(\\)|std\\(\\)", feat$V2, value = TRUE)
xtestrainR <- xtestrain[,meanStdColumns]  # Extracted Measurement

# Uses descriptive activity names to name the activities in the data set

ytestrain$V1=gsub(1,"WALKING",ytestrain$V1)
ytestrain$V1=gsub(2,"WALKING_UPSTAIRS",ytestrain$V1)
ytestrain$V1=gsub(3,"WALKING_DOWNSTAIRS",ytestrain$V1)
ytestrain$V1=gsub(4,"SITTING",ytestrain$V1)
ytestrain$V1=gsub(5,"STANDING",ytestrain$V1)
ytestrain$V1=gsub(6,"LAYING",ytestrain$V1)


#  Appropriately label the data set with descriptive variable names. 
colnames(subtestrain) <- "Subject"
colnames(ytestrain) <- "Activity"
featname <- as.character(feat$V2)
colnames(xtestrain) <- featname
colnames(xtestrainR) <- meanStdColumnsNames

# Create  a data set containing only the measurements on mean() and std() with 
# descriptive activity names and descriptive variable names
MergedDF <- cbind(subtestrain,ytestrain,xtestrainR)


#  Creates a second, independent tidy data set with the
#  average of each variable for each activity and each subject

library(reshape2)
MergedDFM <- melt(MergedDF,id=c("Subject","Activity"),measure.vars=meanStdColumnsNames)
MergedData <- dcast(MergedDFM,Subject+Activity ~ variable,mean)


# Output the second Tidy dataset as a txt file "MergedData.txt" in the current directory

write.table(MergedData,"MergedData.txt",row.name=FALSE )




