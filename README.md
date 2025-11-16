# SQL-Data-Cleaning-Layoffs
SQL Data Cleaning Project — Layoffs Dataset (Guided by Alex The Analyst)

This project is a guided SQL data cleaning exercise by Alex The Analyst, where I implemented a complete data cleaning workflow on a real-world layoffs dataset.
The dataset contains information about company layoffs across industries, countries, and funding stages.
The goal was to take a raw, messy dataset and transform it into a clean, analysis-ready table using core SQL data transformation techniques.

Key Steps & Techniques
1. Data Duplication Handling
Created a staging table to work safely on the data without altering the original (layoffs_staging).
Used window functions (ROW_NUMBER() OVER(PARTITION BY ...)) to identify duplicates.
Deleted duplicate records to ensure data accuracy and consistency.

2. Data Standardization
Trimmed unnecessary spaces from company names using TRIM().
Standardized inconsistent industry names (e.g., grouped variations of “Crypto”).
Normalized country names by removing trailing punctuation.
Converted the date column from text to proper DATE format using STR_TO_DATE().

3. Handling Null & Blank Values
Replaced blank entries with NULL values for clarity.
Imputed missing industry values by joining with other records from the same company.
Removed incomplete rows where both total_laid_off and percentage_laid_off were null.

4. Final Dataset Preparation
Dropped helper columns (row_num) used for cleaning.
Verified transformations with quality checks via SELECT statements.
Produced a clean, ready-to-analyze dataset.

SQL Concepts Used
Window Functions: ROW_NUMBER()
CTEs (Common Table Expressions)
Joins for filling missing values
String Manipulation: TRIM(), LIKE, TRAILING
Date Conversion: STR_TO_DATE()
Data Validation: Filtering, aggregation, verification

Tools & Environment
Database: MySQL
Language: SQL

Source: Guided project by Alex The Analyst
Focus: Data Cleaning, Data Preparation, ETL Fundamentals

Outcome
✅ Transformed raw, inconsistent data into a clean dataset ready for analysis.

✅ Practiced real-world SQL data cleaning techniques used in data analytics.

✅ Strengthened ETL and data wrangling skills in MySQL.

✅ Transformed raw, inconsistent data into a clean dataset ready for analysis.
✅ Practiced real-world SQL data cleaning techniques used in data analytics.
✅ Strengthened ETL and data wrangling skills in MySQL.
