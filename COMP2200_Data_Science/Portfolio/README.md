# Data Science Portfolio

UMUT DEMIRHAN | 46739106 | Master of Business Analytics

This repository contains the files for the Portfolio task for COMP2200/6200 in S1 2022. 


## Table of Portfolio Parts

- Portfolio Part 1
- Portfolio Part 2
- Portfolio Part 3
- Portfolio Part 4

## Portfolio Part 1
This task is the analysis of MovieLens Data collected by the GroupLens Research Project at the University of Minnesota
The dataset has eight columns and 100000 rows, and the columns are explained below;
#### Description of Fields
- userId - the user's id
- age - the user's age
- gender - the user's gender
- occupation - the user's occupation
- movieId - the movie's id
- rating - the user's rating towards the movie
- genre - the genre of the movie
- timestamp - the timestamp indicating when the user rated the movie
 
#### The task sections 
- Removing the missing data
- Descriptive statistics
- Plotting and Analysis
- Summary of the data
- Further analysis of the data with visualisations

#### Outcome of the task 
The descriptive statistics demonstrate that the target variable(feedback) is not correlated with the features. 
I have practised what I have learned from the unit, including data cleaning, analysis and visualisation.

## Portfolio Part 2
The second Portfolio task is to train linear regression models to predict users' movie ratings. This process involves a standard Data Science workflow of data exploration, model development, prediction, and evaluation. This task evaluates the impacts of feature selections and different training/testing data sizes on the model performance.

#### The task sections 
- Import Cleaned MovieLens Dataset
- Explore the Dataset
- Split Training and Testing Data
- Train Linear Regression Models with Feature Selection
- Evaluate Models
- Visualise, Compare and Analyse the Results

#### Outcome of the task 
The result of the models shows that Models do not work well as the correlations are weak. 
I have practised how to train linear regression models with feature selection and evaluate models by visualising the results.

## Portfolio Part 3
In this Portfolio task, I continue working with the Movielens data. The dataset columns are slightly different from those provided in the previous Portfolio tasks, where the 'feedback' column replaces the 'rating' column. There are two values regarding the 'feedback', one indicating the user likes the corresponding movie; otherwise, zero.

#### The task sections 
- Exploration of the Dataset
    - Visualizations
- Predictions
    - Simple Logistic Regression model
        - Feature Selection
        - Evaluation of the model
    - K-nearest neighbour
- Summary of the task

#### Outcome of the task 
The model results show that the estimation is improved by around %5 with the KNN relative to Logistic Regression; However, it is still not good enough to estimate the target variable.
It concludes that providing more correlated features, such as the budget of the movies, can improve the estimation and accuracy rate.
I have practised what I have learned previously, and  K-nearest neighbour.

## Portfolio Part 4
this Portfolio work tries to predict whether there is any fire danger rather than determining the severity of the wildfires in the north-east region of Portugal. The source of the dataset is [Forest Fires Data Set(UCI)](http://archive.ics.uci.edu/ml/datasets/Forest+Fires).
The dataset has 13 columns and 523 rows.

#### The task sections 
- The Dataset Import and Cleanup
- Exploring and Preparing the dataset for predictive modelling
   - Univariate Analysis (The target)
   - Bivariate analysis
- Logistic Regression
- K-nearest neighbour
- Summary of the task

#### Outcome of the task 
* KNN classifier model helps to improve the prediction accuracy by 0.07%
    * The results indicate that there is a 67% chance of predicting fires accurately
    * Since the testing accuracy is: 0.67
* Yet, the model is not a significant predictor.
The data length is not enough, and the correlations are not strong; Therefore, the accuracy is not high enough to predict whether there would be a fire in advance. If we could find more related features and data, the model could be more accurate.

I have completed full data analysis and modelling with this task.

