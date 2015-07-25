## Getting & Cleaning Data Course Project  

### **README.md**




**PURPOSE** : To explain how run_analysis.R Script works

**INPUT DATA** : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the input data into  the current working directory and unzip the folder as getdata-projectfiles-UCI HAR Dataset

**The run_analysis.R script performs the following :**	  

1)  Assign file name to each input file in the folder  getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset folder.

2)  Use read.table to read the following input files :

	test/X_test.txt"
	test/y_test.txt"
	test/subject_test.txt"
	train/X_train.txt"
	train/y_train.txt"
	train/subject_train.txt"
	features.txt"
	activity_labels.txt"

    and store them as the following variables :

	xtest 
	ytest 
	subtest
	xtrain 
	ytrain 
	subtrain
	feat 
	activ

2) Use rbind to Merge test and train data to create one dataset for Measurement, Subject and Activity respectively

	xtestrain   :   contains Measurement data

	subtestrain :   contains Subject data

	ytestrain   :   contains Activity data  

3) Use grep to extract only the measurements on mean() and std() into **xtestrainR**   
 
4) Use gsub to provide descriptive activity names for the activities

5) Use colnames to appropriately label the data set with descriptive variable names

6) Use cbind to create  a data set **MergedDF** containing only the measurements on mean() and std()  with 
   descriptive activity names and descriptive variable names

7) Load reshape2 library and use melt and dcast functions to creates a second, independent tidy data set **MergedData** with
   average of each measurement variable for each activity and each subject.

8) Use write.table to output the second Tidy data set as a txt file **"MergedData.txt"** in the current working directory


**A github repository is created with the following files :**

1) run_analysis.R script : to extract and clean the data to produce a tidy data set  

2) README.md 		 : explains how the run_analysis.R script works 

3) CodeBook.md 		 : describes the variables, the data, and any transformations or work that you performed to clean up the data

4) MergedData.txt        : the required tidy data set as a txt file   


**References :** 

https://class.coursera.org/getdata-030/forum/thread?thread_id=37

https://class.coursera.org/getdata-030/forum/thread?thread_id=107


