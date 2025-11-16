-- Data Cleaning 

SELECT *
FROM data_type.layoffs;

-- first thing we want to do is create a staging table. This is the one we will work in and clean the data. We want a table with the raw data in case something happens


CREATE TABLE new_table
like layoffs;

SELECT *
FROM new_table;

INSERT new_table
SELECT *
FROM layoffs;

-- Now when we are data cleaning we usually follow a few steps
-- 1. Check for duplicates and remove any
-- 2. Standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. Remove any columns and rows that are not necessary - few ways

-- 1. Remove Duplicates
--First let's check for duplicates

SELECT *,
ROW_NUMBER ()
OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM new_table;

WITH Remove_Duplicates AS
(
SELECT *,
ROW_NUMBER () OVER( 
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM new_table
)
SELECT *
FROM Remove_Duplicates
WHERE row_num > 1 
;
SELECT *
FROM new_table 
WHERE company like 'casper%'
;
CREATE TABLE `new_table1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM new_table1;

insert into new_table1
SELECT *,
ROW_NUMBER () OVER( 
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM new_table;

SELECT *
FROM new_table1
WHERE row_num > 1;

DELETE 
FROM new_table1
WHERE row_num > 1;


SELECT DISTINCT company
FROM new_table1
ORDER BY 1;

UPDATE new_table1
SET company = trim(company);

SELECT DISTINCT INDUSTRY
FROM new_table1
ORDER BY 1;

UPDATE new_table1
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM new_table1;

UPDATE new_table1
SET country =  TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';
SELECT `date`
FROM new_table1;

UPDATE new_table1
SET `date`= str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE new_table1
MODIFY COLUMN `date` DATE;

SELECT *
FROM new_table1
WHERE industry IS NULL OR industry = '';

UPDATE new_table1
SET industry = null
WHERE industry ='';

SELECT *
FROM new_table1
WHERE company LIKE 'bally%';

SELECT t1.industry, t2.industry
FROM new_table1 AS t1
JOIN new_table1 AS t2
	ON t1.company = t2.company	
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;
    
UPDATE new_table1 AS t1
JOIN new_table1 AS t2
	ON t1.company = t2.company	
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

DELETE 
FROM new_table1
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

ALTER TABLE new_table1
DROP COLUMN row_num ;

SELECT *
FROM new_table1


