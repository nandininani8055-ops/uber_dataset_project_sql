# 🚖 Uber Trip Data Analysis using SQL

## 📌 Project Overview

This project analyzes Uber trip data using **MySQL** to extract meaningful business insights. It covers the complete data analysis process, including data exploration, data cleaning, handling missing values, aggregation, subqueries, and window functions.

The objective of this project is to demonstrate SQL skills by answering real-world business questions using Uber trip data.

---

## 🛠️ Tools & Technologies

- MySQL
- SQL
- GitHub

---

## 📂 Dataset Information

The dataset contains Uber trip records with the following columns:

- Start Date
- End Date
- Category
- Start Location
- Stop Location
- Miles
- Purpose

---

## 📊 Project Workflow

### 1. Database Creation
- Created a dedicated database for the project.
- Selected the database for further analysis.

### 2. Data Exploration
- Viewed the dataset.
- Counted the total number of records.

### 3. Data Cleaning
- Identified NULL and blank values.
- Replaced missing values with meaningful default values.
- Updated missing dates where required.

### 4. Business Analysis
Performed multiple SQL queries to generate business insights from the dataset.

---

# 📈 Business Questions Solved

### 1. Total Number of Uber Trips
Calculated the total trips recorded in the dataset.

### 2. Total Miles Traveled
Calculated the overall distance traveled.

### 3. Longest and Shortest Trip
Identified the maximum and minimum trip distances.

### 4. Business vs Personal Trips
Compared the number of Business and Personal trips.

### 5. Most Common Trip Purpose
Identified the most frequently occurring trip purposes.

### 6. Top 10 Trip Purposes by Total Distance
Analyzed which trip purposes covered the highest total miles.

### 7. Top 5 Most Visited Destinations
Identified the destinations visited most frequently.

### 8. Most Frequent Pickup Locations
Found the locations where trips most commonly started.

### 9. Trips Longer Than the Average Distance
Used a subquery to identify trips with above-average distance.

### 10. Running Total of Miles
Calculated the cumulative miles traveled using a window function.

### 11. Rank Trips by Distance
Ranked trips according to miles traveled.

### 12. Categorize Trips
Classified trips into:
- Short Trip
- Medium Trip
- Long Trip

### 13. Trips Above Category Average
Compared each trip against the average distance within its category.

### 14. Compare Current Trip with Next Trip
Used the **LEAD()** window function.

### 15. Compare Current Trip with Previous Trip
Used the **LAG()** window function.

### 16. Divide Trips into Quartiles
Used the **NTILE()** function to group trips into four distance-based quartiles.

---

# 💡 SQL Concepts Used

- CREATE DATABASE
- USE
- SELECT
- COUNT()
- SUM()
- MAX()
- MIN()
- GROUP BY
- ORDER BY
- HAVING
- UPDATE
- WHERE
- CASE
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- Window Functions
  - RANK()
  - LEAD()
  - LAG()
  - NTILE()
  - SUM() OVER()

---

# 📌 Key Insights

- Identified the total number of Uber trips and total miles traveled.
- Found the longest and shortest trips.
- Compared Business and Personal travel patterns.
- Discovered the most common trip purposes.
- Identified the most visited destinations and pickup locations.
- Classified trips into different distance categories.
- Used advanced SQL window functions for ranking, cumulative analysis, and trip comparisons.
- Improved data quality by handling missing values before performing analysis.

---

# 🎯 Learning Outcomes

Through this project, I gained practical experience in:

- SQL Data Cleaning
- Data Exploration
- Aggregate Functions
- Conditional Statements
- Subqueries
- Correlated Subqueries
- Window Functions
- Business Data Analysis
- Writing optimized SQL queries

---

# 🚀 Future Improvements

- Create SQL Views for reporting.
- Build interactive dashboards using Power BI or Tableau.
- Add stored procedures and triggers.
- Optimize complex queries for better performance.
- Perform monthly and yearly trend analysis.

---

# 👨‍💻 Author

**NANDINI GANESH**

BCA Graduate | Aspiring Data Analyst

### Skills

- SQL
- MySQL
- Python
- Excel
- Power BI
- Data Analytics

---

## ⭐ If you found this project useful, please consider giving it a Star on GitHub!
