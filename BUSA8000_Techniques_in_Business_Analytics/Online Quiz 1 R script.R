
# Installing and Loading packages and libraries which I may need it
install.packages("VIM")
library(readr)
library(dplyr)
library(tidyverse)
library(VIM)

hr_data <- read_csv("data_scientist_hr.csv")
#Importing database 

str(hr_data)
head(hr_data)
summary(hr_data)

#QUESTION 1 , How many individual data scientists are included in this data set?
# I assume that all the employees in the database are data scientists

Q_1 <- length(unique(hr_data$enrollee_id))
Q_1

#QUESTION 2 , How many data scientists are listed as male in this data set?

Q_2 <- nrow( hr_data %>%
        filter(gender== "Male"))
Q_2

#QUESTION 3 , For female data scientists, how many had high school listed as their highest level of education?

Q_3 <- nrow(hr_data %>%
       filter((education_level == "High School") & (gender == "Female")))
Q_3

#QUESTION 4 , How many data scientists are listed as having fewer than 5 years experience in this data set?
# Please read
# IMPORTANT => I assume the Na values should  not be included as 'zero' in the filter so I did not execute the code below
# hr_data["experience"][is.na(hr_data["experience"])] <- '0'
 
hr_data["experience"][hr_data["experience"] == "<1"] <- "0"
hr_data["experience"][hr_data["experience"] == ">20"] <- "20"

sapply(hr_data, class)
hr_data$experience <- as.numeric(as.character(hr_data$experience))
sapply(hr_data, class)

Q_4 <- nrow(hr_data %>%
       filter((experience < 5)))
Q_4 

#QUESTION 5,For data scientists with no enrollment in university, what proportion have relevant experience?
# Give your answer as a percentage to 2 decimal places and do not include a percentage sign (e.g. 12.345% would be 12.35).

no_enrol <- nrow(hr_data %>%
       filter((enrolled_university =='no_enrollment')))

no_enrol_with_exp <- nrow( hr_data %>%
           filter((relevent_experience == "Has relevent experience") & enrolled_university =='no_enrollment'))

Q_5 <- round((no_enrol_with_exp / no_enrol) * 100, digit= 2)
Q_5

#QUESTION 6, If you perform the calculation from Q5 for all 3 of full time, part time, and no enrolment in university,
#you would have found that as the level of university enrolment increases, the proportion of data scientists that 
#have relevant experience decreases.
# Which of the following would be a likely explanation for this pattern?


part_exp <-  nrow(hr_data %>%
      filter((relevent_experience == "Has relevent experience") & enrolled_university =='Part time course'))

Q_6_part <- round((part_exp / no_enrol) * 100, digit= 2)
Q_6_part

full_exp <-  nrow(hr_data %>%
     filter((relevent_experience == "Has relevent experience") & enrolled_university =='Full time course'))

Q_6_full <- round((full_exp / no_enrol) * 100, digit= 2)
Q_6_full

#For QUESTIONS 7, 8, and 9 below, first separate the data set into 2 parts:

#Data scientists with FEWER THAN 50 hours of training,
few_50 <- nrow(hr_data %>%
  filter((training_hours < 50)))
few_50

#Data scientists with AT LEAST 50 hours of training completed
atleast_50 <- nrow(hr_data %>%
  filter((training_hours >= 50)))
atleast_50

# Questions 7, What proportion of data scientists have at least 50 hours of training completed?
Q_7 <- round((atleast_50 / nrow(hr_data)) * 100, digit= 2)
Q_7

# Questions 8, For data scientists with less than 50 hours of training, 
#how many do not have their years of experience listed?

Q_8 <- nrow(hr_data %>%
       filter((training_hours < 50) & is.na(hr_data$experience)))
Q_8

# Questions 9, For data scientists with at least 50 hours of training, 
#what proportion of data scientists have greater than 10 years of experience?

atleast_50_EXP_10 <- nrow(hr_data %>%
       filter((training_hours >= 50) & (experience > 10 )))

Q_9<- round((atleast_50_EXP_10 / atleast_50) * 100, digit= 2)
Q_9
# Questions 10, 
# Using this reduced data set, run the knn algorithm with k=5, using city development index,
# years of experience, and hours of training to estimate the missing education level values.
# What is the estimated education level of the data scientist with ID 25727?

df_clean <- hr_data
df_clean["experience"][df_clean["experience"] == "<1"] <- "0"
df_clean["experience"][df_clean["experience"] == ">20"] <- "20"

df_clean <- df_clean[complete.cases(df_clean[,c('experience','city_development_index','training_hours')]),]

sum(is.na(df_clean$education_level))

#KNN

df_clean <- df_clean[,c('enrollee_id','education_level','experience','city_development_index','training_hours')]
head(df_clean)

Prediction <- kNN(df_clean,k=5)

Q_10 <- Prediction[Prediction$enrollee_id == 25727,2]
Q_10
# education level is 'Graduate' for enrollee_id == 25727

# Question 11, First, for data scientists with Humanities as their major discipline, calculate the proportion 
#(as a percentage) that are looking for new jobs. 
#Then perform the same calculation for a major discipline of STEM.
#What is the result when you take the proportion for Humanities majors and subtract the proportion 
#for STEM majors? Give your answer as a percentage to 2 decimal places and do not include a percentage sign
#(e.g. 12.345% would be 12.35).
#Note: If your answer is positive, it suggests that Humanities majors are more likely to switch jobs than 
#STEM majors, and the reverse if your answer is negative.

#------Humanitines-------
hum_n_jobs <- nrow(hr_data %>%
                 filter((major_discipline == "Humanities") & target =='1'))

hum_n_all <- nrow(hr_data %>%
                 filter((major_discipline == "Humanities")))

hum <- round((hum_n_jobs / hum_n_all) * 100, digit= 2)

#------STEM-------
stem_n_jobs <- nrow(hr_data %>%
                 filter((major_discipline == "STEM") & target =='1'))

stem_n_all <- nrow(hr_data %>%
                 filter((major_discipline == "STEM")))

stem <- round((stem_n_jobs / stem_n_all) * 100, digit= 2)

#---------Subtraction---- 
Q_11 <- hum-stem
Q_11





