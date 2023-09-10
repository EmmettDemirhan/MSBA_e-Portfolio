   #  Reflective Report of Data Science(COMP2200)
                                        
                UMUT DEMIRHAN | 46739106 | Master of Business Analytics

This report discusses, the process of solving problems and learning to use notebooks, how I have progressed from the start of the unit and what I am interested in doing with this in the future and provides information about Portfolio 4.

Before starting the course, I completed a few related courses on Udemy and Coursera. These courses allowed me to get familiar with the Jupyter notebook and develop some Python data analysis skills. When I started the course, listening to the lectures and practising in the workshops helped me develop data science skills. Subsequently, Portfolio tasks contributed to the development of my statistical analysis skills. I developed my skills in making predictions to solve problems by using past data and improving the accuracy of these predictions, creating the best model in terms of accuracy, and visualising and interpreting these outputs.

The learning outcomes are as follows;
- WEEK 1: Introduction to Data Science, Learning Python, Analytics, Git and Github.
- WEEK 2: Python Data Structures, NumPy, Pandas and  Data Formats.   
- WEEK 3: Github Workflow, Descriptive Statistics, Privacy in Data, CRISPR Methodology and Outliers.
- WEEK 3: Python Data Structures, NumPy, Pandas and  Data Formats.   
- WEEK 4: Visualisation, Correlation and causation, using Seaborn.
- WEEK 5: Predictive modelling, linear and logistic regression as machine learning algorithms.    
- WEEK 6: Jupyter Notebook and Software Engineering in Data Science
- WEEK 7: Unsupervised Learning, clustering algorithms to find structure within a data set and how to extract numerical features from text to use in the analysis.
- WEEK 8: Supervised Learning, The K-nearest neighbour algorithm and using a cross-validation approach to conduct the parameter tuning. 
- WEEK 9: Naive Bayes (NB) Classifier. 
- WEEK 10: Artificial Neural Networks and Multilayer perceptrons(MLPs) as feed-forward neural networks.
- WEEK 11:  Decision Tree Models.
- WEEK 12: This week will be Data Science Guest Lecture in which a Guess tell us about Data Science.

At the end of this course, I want to solve business problems in the consulting industry by using the skills I have learned and presenting these solutions to the stakeholders. Especially, I would like to work on financial decision making and present outcomes to the customers using visualisation tools.


## Portfolio Part 4

In this Portfolio task, we did not receive a dataset. We were free to choose the dataset,define the problem and solve the problem using the skills that we have learned.

I was interested in predicting future wildfires to protect the environment; Therefore, the chosen problem is the increasing number of forest fires due to global warming and the damage caused by these fires. My solution is that If we can determine in advance whether these fires will break out, we can take the necessary precautions and reduce the damage.
This Portfolio task aims to predict whether there is any fire risk instead of determining the severity of the fires in the northeast region of Portugal by using the data cited below. The source of the dataset is [Forest Fires Data Set(UCI)](http://archive.ics.uci.edu/ml/datasets/Forest+Fires).
I have chosen this dataset because it was on a suggested [website](http://archive.ics.uci.edu) for this task, and it has enough attributes and instances to compute.
The target is to predict whether wildfires occur or not in particular conditions. The target variable(area) provides a piece of metric information about how severe the fire is. However, this portfolio aims to predict if any fires occur so that authorities can take necessary measures in advance. To do that, the target type was changed to a boolean variable. If it is 0 means no fire or 1 means there is a fire possibility. 

When I applied descriptive statistic, unfortunately, I realise that the correlation between the target variable and the features were quite weak. Logistic regression was more suitable for this task since the target became boolean. Therefore, I applied Logistic regression with feature selection to improve the model accuracy. Yet, the model did quite poor and resulted in negative R squared and high mean squared error(MSE). 
The results are below;
  - MSE: 0.39
  - R^2: -0.6
  - Accuracy score: 0.61
61%  accuracy is slightly more than a random guess. Therefore,  the authorities may not rely on this model.

To improve the prediction, I applied a more advanced model, k-nearest neighbours (KNN) because it is capable of achieving high accuracy in a wide range of prediction-type problems.
KNN classifier model helps to improve the prediction accuracy by 6%. The results indicate that there is a 67% chance to predict fires accurately since the testing accuracy is: 0.67. Yet, the model is not a significant predictor because 67% may not be found  good enough by the authorities. In other word, it may not be helpful at all.

As a result, the data length is insufficient, and the correlations are weak; thus, the accuracy is unsatisfactory to predict whether a fire will occur in advance. The model could give more accurate predictions if we could find more related features and data. This dataset did not provide sufficient prediction accuracy. However, it shows us that if we find more data and more correlated attributes for prediction, it may help predict the wildfires before it occurs.