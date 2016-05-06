#DATA DICTIONARY 
####Dataset: UCI_HAR_means.txt

The dataset contains 180 lines of data. Each line of data corresponds to 6 types of activities (**column 2**) recorded per 30 participants (**column 1**).

The dataset contains a summary of the means across the mean values and means across the standard deviations for each participant and type of activity for the measurements (**columns 3-81**) described below. 

##   subjectid
Description: Participant unique identification number (**column 1**)

Storage mode: integer

Factor with 6 levels:

	- Numbers 1 to 30    
	
##   activity
Description: Type of activity performed (**column 2**)

Storage mode: integer

Factor with 6 levels:

	- 'LAYING'                      
 	- 'SITTING'                   
	- 'STANDING'                    
	- 'WALKING'                     
	- 'WALKING_DOWNSTAIRS'          
	- 'WALKING_UPSTAIRS'            

##  variables in columns 3 to 81
Description: Type of measurement captured (**columns 3-81**)

Storage mode: numeric

Numeric values with variable names containing the descriptions summarized below:

|Denotation|Description|
| ------------- |-------------|
|**Mean** at intial of variable name|The values present the mean values for each participant and activity for each measurement|
|**Time**|The time domain signals time captured at a constant rate of 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise|
|**Freq**|A Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals| 
|**X**, **Y** or **Z**|The values for these variables come from the accelerometer and gyroscope 3-axial raw signals |
|**BodyAcc** and **GravityAcc**|The acceleration signal separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz|
|**BodyAccJerk** and **BodyGyroJerk**|The body linear acceleration and angular velocity derived in time to obtain Jerk signals|
|**BodyAccMag**, **GravityAccMag**, **BodyAccJerkMag**, **BodyGyroMag**, **BodyGyroJerkMag**|The magnitude of the three-dimensional signals calculated using the Euclidean norm| 
|**Mean** and **Std** not at initial of variable name|The mean and the standard deviations of the above listed measurements|
|**X**, **Y** or **Z**|The values for these variables come from the accelerometer and gyroscope 3-axial raw signals |
	
