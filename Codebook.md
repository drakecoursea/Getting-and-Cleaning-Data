# Codebook

## Dataset used

Human Activity Recognition Using Smartphones Dataset<br>
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br>
Smartlab - Non Linear Complex Systems Laboratory<br>
DITEN - Università degli Studi di Genova.<br>
Via Opera Pia 11A, I-16145, Genoa, Italy.<br>
activityrecognition@smartlab.ws<br>
www.smartlab.ws<br>

## Overview
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Information provided for each record:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Files included:

- 'README.txt': More information about the files
- 'features.txt': List of all 561 features.
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'activity_labels.txt': Links the 6 class labels with their activity name.
- 'train/X_train.txt': Training set, with 7352 observations of 561 variables.
- 'train/y_train.txt': Training labels for X_train.txt.
- 'test/X_test.txt': Test set, with 2947 observations of 561 variables.
- 'test/y_test.txt': Test labels for X_test.txt.
- 'train/subject_train.txt': Denotes the ID of each of the subject in X_train.txt. Its range is from 1 to 30. 
- 'test/subject_test.txt': Denotes the ID of each of the subject in X_test.txt. Its range is from 1 to 30. 

**Note**:
- The data files in the "Inertial Signals" folders were ignored, as they were not needed. 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Processing steps

1. The relevant data files were read into data frames.
2. The column headers were added into the individual datasets.
3. The training and test sets were merged into one data set.
4. Columns containing mean measurements "mean", standard deviation "std", the subject ID and activity ID were all extracted.
5. Activity names were merged into the data set by activity ID.
6. The data set was relabelled with descriptive variable names.
7. A second, independent tidy data set with the average of each variable for each activity and each subject was created.
8. The tidy data set is exported into a TXT file.









## License acknowledgement:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
