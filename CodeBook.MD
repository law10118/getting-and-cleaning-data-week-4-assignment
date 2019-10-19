---
title: "CodeBook.md"
author: "law10118"
date: "10/19/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Getting and cleaning data - week 4 assignment 
## Assignment briefing
The data in this assignment represent data collected from the accelerometers 
in the Samsung Galaxy S smartphone. 
### The data folder of 2 separated parts of training and testing, each comprised of 3 smaller parts 
#X - the main data body comprosied of coordinate for each 3-dimension movement 
#Y - indicate the type of action 
#sub - indicate to which subject the actions belonged to.
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
### Description of the variables 
The subject identifier is the ID of the subject, ranging from 1 to 30, 
The activity column include 6 types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
### Variable units 
activity variable is factor type. Subject variable is integer type. All other variables are numeric type
### Transformation performed to tidy up the data
0. read the 2 folders train & test, and the files features,activity_labels 
1. Coupling the train and test data sets of X,Y and Sub by the rows
2.1. from features, filter for only lines which have either mean or std 
2.2. subset from X only the lines which have mean or std
3.1. Naming the columns of X,Y & sub
3.2. Combine the columns of X,Y & sub
4. Express both activity and subject as factor, with activity labeled and leveled based on activity_labels  
5.1. Group the data by the experimental subject and types of activity 
5.2. Averaging each filtered columns
6. Export the independent dataset
