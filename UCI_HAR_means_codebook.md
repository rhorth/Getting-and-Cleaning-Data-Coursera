========================================================================
#DATA DICTIONARY 
##Dataset: UCI_HAR_means.txt

The dataset contains 180 lines of data. Each line of data corresponds to 6 types of activities (column 2) recorded per 30 participants (column 1).

The dataset contains a summary of the means across the mean values and means across the standard deviations for each participant and type of activity for the measurements (columns 3-81) described below. 

##   subjectid
Description: Participant unique identification number

Storage mode: integer

Factor with 30 levels

##   activity
Description: Type of activity performed

Storage mode: integer

Factor with 6 levels

	- 'LAYING'                      
 	- 'SITTING'                   
	- 'STANDING'                    
	- 'WALKING'                     
	- 'WALKING_DOWNSTAIRS'          
	- 'WALKING_UPSTAIRS'            

##   variables in columns 3 to 81
Description: Type of measurement captured

Storage mode: numeric

Numeric values with variable names containing the descriptions summarized below:

	- The values present the mean values for each participant and activity for each measurement (denoted by 'Mean' at initial of variable name)
 	- The values for these variables come from the accelerometer and gyroscope 3-axial raw signals (denoted by X, Y or Z).
 	- The time domain signals time (denoted by 'Time') were captured at a constant rate of 50 Hz. These signals were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
 	- The acceleration signal was separated into body and gravity acceleration signals (denoted by BodyAcc and GravityAcc) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
 	- The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (denoted by BodyAccJerk and BodyGyroJerk). 
 	- The magnitude of these three-dimensional signals were calculated using the Euclidean norm (denoted by BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag). 
 	- A Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals (denoted by 'Freq'). 
 	- The mean and the standard deviations of the above listed measurements are denoted by Mean and Std.
	
