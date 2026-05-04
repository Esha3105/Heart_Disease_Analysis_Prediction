# Heart Disease Analysis & Prediction

## 📊 Project Overview

This project focuses on analyzing heart disease patient data and building a predictive model to identify whether a patient is likely to have heart disease.

It combines **SQL, Excel, Python (EDA), and Machine Learning** to perform end-to-end healthcare data analysis, from data cleaning to prediction.

---

## 🎯 Objectives

* Analyze key health indicators affecting heart disease
* Identify high-risk patient groups
* Perform SQL-based analytical queries
* Visualize patterns using Python (EDA)
* Build a predictive model using Logistic Regression

---

## 🛠️ Tools & Technologies

* SQL (MySQL) – Data analysis and querying
* Python – Data analysis and modelling

  * Pandas
  * Matplotlib
  * Seaborn
  * Scikit-learn
* Excel – Data cleaning and feature creation

---

## 📁 Dataset

* Total Records: **303 patients**
* Total Features: **14 columns**
* Domain: Healthcare

### Key Features

* Age
* Sex
* Chest Pain Type (cp)
* Resting Blood Pressure (trestbps)
* Cholesterol (chol)
* Fasting Blood Sugar (fbs)
* Rest ECG (restecg)
* Max Heart Rate (thalach)
* Exercise Induced Angina (exang)
* ST Depression (oldpeak)
* Slope
* Number of Major Vessels (ca)
* Thalassemia (thal)

### Target Variable

* 0 → No Heart Disease
* 1 → Heart Disease Present

---

## 🧹 Data Preprocessing (Excel)

* Cleaned dataset and handled inconsistencies
* Created derived columns:

  * Age Category (Young, Middle-aged, Senior)
  * Blood Pressure Category
  * Cholesterol Risk Category
* Transformed binary columns (0/1) into meaningful categories
* Prepared a structured dataset for SQL and Python analysis

---

## 🧠 SQL Analysis

Performed analytical queries to extract insights from the dataset.

### Techniques Used

* CASE WHEN
* Subqueries
* Aggregations (COUNT, AVG, SUM)
* Percentage calculations
* Group-based analysis

### Key Business Questions

* Which age group has the highest heart disease cases?
* Does high cholesterol increase disease risk?
* Which BP category shows the highest risk?
* What percentage of senior patients have heart disease?
* How do multiple risk factors combine to increase disease probability?

---

## 📊 Python Analysis (EDA)

Performed exploratory data analysis using Python.

### Visualizations

* Heart Disease Distribution
* Age Category vs Disease
* Gender vs Disease
* Chest Pain Type vs Disease
* Cholesterol Distribution
* Box Plots for Outlier Detection

### Outlier Analysis

* Used box plots to identify outliers in:

  * Cholesterol
  * Resting Blood Pressure
  * Maximum Heart Rate
* Observed extreme values (e.g., high cholesterol and BP)
* Retained outliers as they represent real-world medical conditions

---

## 🤖 Machine Learning Model

### Model Used

* Logistic Regression

### Why Logistic Regression?

* Suitable for binary classification (0 / 1)
* Simple and interpretable for healthcare data

---

## 📈 Model Performance

* Accuracy: **81.97%**

### Confusion Matrix

* True Positives: **26**
* True Negatives: **24**
* False Positives: **5**
* False Negatives: **6**

---

## 🔍 Key Insights

* Senior patients showed higher disease risk
* High cholesterol and BP are strong indicators
* Chest pain type plays a critical role
* Multiple risk factors significantly increase probability of disease

---

## 🚀 Business Impact

* Helps identify high-risk patients early
* Supports preventive healthcare decisions
* Demonstrates predictive analytics in healthcare
* Combines SQL, EDA, and ML for real-world use

---

## 📌 How to Use

1. Run SQL queries for analysis
2. Open Python notebook (`.ipynb`)
3. Execute EDA and model steps
4. Review insights and predictions

---

## 📸 Project Screenshots

![Chart Screenshot 1](chart_screenshot1.png)
![Chart Screenshot 2](chart_screenshot2.png)
![Outlier Screenshot](outlier_chart_screenshot.png)
---

## 💼 Resume Value

This project demonstrates:

* Data cleaning and feature engineering (Excel)
* SQL analytical skills
* Python-based EDA and visualization
* Outlier detection and handling
* Machine Learning implementation
* End-to-end data analysis workflow

---
