CREATE DATABASE heart_patient;
USE heart_patient;

-- Which age group has the highest number of heart disease cases?
SELECT 
    age_category, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY age_category
ORDER BY total_cases DESC;

-- What is the gender-wise distribution of heart disease patients?
SELECT 
    gender_label, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY gender_label
ORDER BY total_cases DESC;

-- Which chest pain type (cp) is most common among patients with heart disease?
SELECT 
    chest_pain_type, chest_pain, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY chest_pain_type , chest_pain
ORDER BY total_cases DESC;

-- Does high cholesterol increase the chances of heart disease?
SELECT 
    cholestrol_risk_category, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY cholestrol_risk_category
ORDER BY total_cases DESC;

-- Which blood pressure category has the highest heart disease cases?
SELECT 
    bp_category, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY bp_category
ORDER BY total_cases DESC;

-- Does high fasting blood sugar (fbs) show a higher disease risk?
SELECT 
    blood_sugar_status, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY blood_sugar_status
ORDER BY total_cases DESC;

-- Which heart rate category (thalach) has the highest disease occurrence?
SELECT 
    heart_rate_category, COUNT(*) AS total_cases
FROM
    heart
WHERE
    target = 1
GROUP BY heart_rate_category
ORDER BY total_cases DESC;

-- How many patients have multiple major risk factors (high cholesterol + high BP + high sugar)?
SELECT 
    COUNT(*) AS total_patients
FROM
    heart
WHERE
    cholestrol_risk_category = 'High Risk'
        AND bp_category = 'High BP'
        AND blood_sugar_status = 'High Sugar';

-- Which age group has the highest number of high-risk patients?
SELECT 
    age_category, COUNT(*) AS high_risk_patients
FROM
    heart
WHERE
    cholestrol_risk_category = 'High Risk'
        AND bp_category = 'High BP'
GROUP BY age_category
ORDER BY high_risk_patients DESC;

-- What is the average cholesterol level for patients with and without heart disease?
SELECT 
    ROUND(AVG(cholestrol), 2) AS avg_cholestrol_level,
    disease_status
FROM
    heart
GROUP BY disease_status;

-- How many patients fall into Low / Moderate / High Risk categories based on BP and Cholesterol categories?
SELECT 
    COUNT(*) AS total_cases,
    bp_category,
    cholestrol_risk_category,
    CASE
        WHEN
            bp_category = 'High BP'
                AND cholestrol_risk_category = 'High Risk'
        THEN
            'High Risk'
        WHEN
            bp_category = 'Elevated'
                OR cholestrol_risk_category = 'Borderline'
        THEN
            'Moderate Risk'
        ELSE 'Low Risk'
    END AS patient_risk
FROM
    heart
GROUP BY bp_category , cholestrol_risk_category;

-- Create a disease severity category using oldpeak values also no.of patients in each category?
SELECT 
    CASE
        WHEN oldpeak <= 1 THEN 'Mild'
        WHEN oldpeak >= 1 AND oldpeak <= 2.5 THEN 'Moderate'
        ELSE 'Severe'
    END AS disease_severity,
    COUNT(*) AS total_cases
FROM
    heart
GROUP BY disease_severity;

-- Rank age groups by total heart disease cases.
SELECT 
	age_category, 
	COUNT(*) AS total_cases, 
RANK() OVER (ORDER BY COUNT(*) DESC) AS risk_rank
FROM 
	heart
WHERE 
	target = 1
GROUP BY age_category;

-- Rank chest pain types by disease occurrence.
SELECT 
	chest_pain_type, 
    COUNT(*) AS total_cases,
RANK() OVER (ORDER BY COUNT(*) DESC) AS risk_rank
FROM 
	heart
WHERE 
	target = 1
GROUP BY chest_pain_type;

-- Find the patient whose cholesterol is highest compared to the overall average.
SELECT
    gender_label
    cholestrol,
    (SELECT AVG(cholestrol)
     FROM heart) AS avg_cholestrol,
    cholestrol - (
        SELECT AVG(cholestrol)
        FROM heart
    ) AS difference_from_avg

FROM heart
ORDER BY difference_from_avg DESC
LIMIT 1;

-- Compare each patient’s cholesterol with the average cholesterol of their age group.
SELECT 
    age_category,
    cholestrol,
    AVG(cholestrol) OVER (
        PARTITION BY age_category
    ) AS avg_agegroup_cholestrol,

    (cholestrol - AVG(cholestrol) OVER (
        PARTITION BY age_category
    )) AS difference_from_agegroup_avg
FROM heart
ORDER BY age_category;

-- Find the top 3 highest-risk patient groups based on combined indicators.
SELECT
	age_category, 
	cholestrol_risk_category,
    bp_category, 
    blood_sugar_status, 
    COUNT(*) AS total_cases,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rn
FROM 
	heart
WHERE 
	target = 1
GROUP BY 
	age_category, 
    cholestrol_risk_category, 
    bp_category, 
    blood_sugar_status
ORDER BY rn
LIMIT 3;

-- What percentage of patients have heart disease?
SELECT 
    ROUND(COUNT(CASE
                WHEN target = 1 THEN 1
            END) * 100.0 / COUNT(*),
            2) AS heart_disease_patients
FROM
    heart;

-- What percentage of senior patients have heart disease?
SELECT 
    ROUND(COUNT(CASE
                WHEN target = 1 THEN 1
            END) * 100.0 / COUNT(*),
            2) AS senior_heart_patients
FROM
    heart
WHERE
    age_category = 'Senior';


