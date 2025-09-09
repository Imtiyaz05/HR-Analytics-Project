 create database Hr_Analyst;
 show databases;
 use Hr_Analyst;
    
    select *from hr_1;
    select * from hr_2;

--  1) Average Attrition Rate for All Departments    
SELECT  h1.Department, ROUND((SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Attrition_Rate
FROM hr_1 AS h1 JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.`Employee id`
GROUP BY h1.Department;



  -- 2) Average Hourly Rate of Male Research Scientists
SELECT  AVG(h1.HourlyRate) AS Avg_Hourly_Rate
FROM hr_1 AS h1 JOIN hr_2 AS h2
ON h1.EmployeeNumber = h2.`Employee id`
WHERE h1.JobRole = 'Research Scientist' AND h1.Gender = 'Male';
    
    
   -- 3) Attrition Rate vs. Monthly Income Stats
SELECT  h1.Attrition, ROUND(AVG(h2.MonthlyIncome), 2) AS Avg_Monthly_Income
FROM  hr_1 AS h1 JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.`Employee id`
GROUP BY  h1.Attrition;
    


    
  -- 4) Average Working Years for Each Department
SELECT h1.Department,
ROUND(AVG(h2.TotalWorkingYears), 2) AS Avg_Working_Years
FROM  hr_1 AS h1 JOIN  hr_2 AS h2 ON h1.EmployeeNumber = h2.`Employee id`
GROUP BY h1.Department;
    
    -- 5) Job Role vs. Work-Life Balance
SELECT 
h1.JobRole,
ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_Work_Life_Balance
FROM hr_1 AS h1 JOIN  hr_2 AS h2 ON  h1.EmployeeNumber = h2.`Employee id`
GROUP BY h1.JobRole;
    
  -- 6) Attrition Rate vs. Years Since Last Promotion
SELECT h2.YearsSinceLastPromotion,
ROUND((SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Attrition_Rate FROM 
hr_1 AS h1 JOIN hr_2 AS h2 ON h1.EmployeeNumber = h2.`Employee id`
GROUP BY  h2.YearsSinceLastPromotion;





   
