Introduction
Stroke is defined by the World Health Organization (WHO) as "rapidly developing clinical signs of focal (or global) disturbance of cerebral function, with symptoms lasting at least 24 hours, or leading to death, with no apparent cause other than of vascular origin". As the second leading cause of death worldwide with an annual mortality rate of about 5.5 million (WHO), not only does the burden of stroke lie in the high mortality but the high morbidity leaves up to 50% of survivors chronically disabled. Thus, stroke is a disease of paramount importance with severe socioeconomic consequences and is an important area for public health research.

In our project, we used a data set containing information on the stroke status of a sample of patients with variables such as age, gender, body mass index (BMI), diagnoses of hypertension and heart disease, and smoking status. Based on the analysis of this data set, we aim to predict the likelihood that a patient will get a stroke while seeking to answer the following common questions about risk factors of stroke:
1.	Is gender a risk factor for stroke?
2.	How dependent is the probability of stroke on the age of a patient?
3.	Is there a strong correlation between hypertension and stroke?
4.	What is the relationship between a patient’s BMI and their likelihood of having a stroke?
5.	Does the stroke status of a patient depend on their smoking status?
6.	Is there any relationship between heart disease and stroke?
7.	Does a patient’s chance of stroke depend on their marriage status?
8.	Is there a higher chance of stroke among employed patients?
9.	Does the type of residence of a patient affect their risk of having a stroke?
10.	What is the relationship between the glucose level of a patient and their stroke status?

This report will examine the data descriptions and analysis using the programming language R. For each of our research objectives, we performed statistical analysis and drew conclusions with the most suitable approach, with detailed justifications for each conclusion.

Data Description
The data set “Stroke Data” is obtained from the online data science community Kaggle. The original data consists of one csv data frame, titled “healthcare-dataset-stroke-data.csv”. The dataset contains 5110 observations and 12 variables, and is available to the public for study and research.

Before proceeding to data analysis, we first performed a preliminary data cleaning to ensure that:
-	Variables ‘stroke’, ‘hypertension’, and ‘heart_disesase’ are converted to factor variables; and
-	Variable ‘bmi’ is converted to a numerical variable.

After the preparation of data, we have 5110 observations with 12 variables to analyze:
1.	id: patient unique identifier
2.	gender: gender of the patient, ‘Male’, ‘Female’, or ‘Other’
3.	age: age of the patient
4.	hypertension: 0 if the patient does not have hypertension, 1 if the patient has hypertension
5.	heart_disease: 0 if the patient does not have heart disease, 1 if the patient has heart disease
6.	ever_married: marriage status of the patient, ‘No’ or ‘Yes’
7.	work_type: occupation of the patient, ‘Govt_job’, ‘Never_worked’, ‘Private’, or ‘Self-employed’
8.	Residence_type: type of residential area of the patient, ‘Rural’ or ‘Urban’
9.	avg_glucose_level: average glucose level in the blood of the patient
10.	bmi: body mass index of the patient
11.	smoking_status: smoking status of the patient, ‘formerly smoke’, ‘never smoked’, ‘smokes’, or ‘Unknown’*
12.	stroke: 1 if the patient had a stroke, 0 if the patient never had a stroke
*Note: ‘Unknown’ means that the information is unavailable for this patient
