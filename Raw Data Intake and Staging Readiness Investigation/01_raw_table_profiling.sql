-- RAW TABLES PROFILING And READINESS CHECK
-- This script is designed to profile the raw tables and check their readiness for data processing. It includes checks for data quality, completeness, and consistency.

-- Table 1: customers_raw --

-- Step 1: confirm row count
SELECT COUNT(*) AS total_customers_raw_rows
FROM raw.customers_raw; 

-- Step 2: Confirm column structure and data types
-- Official database structure
SELECT 
    column_name, 
    data_type, 
    ordinal_position
FROM information_schema.columns
WHERE table_schema = 'raw'
AND table_name = 'customers_raw'
ORDER BY ordinal_position;
-- Visual inspection
SELECT * 
FROM raw.customers_raw
LIMIT 10;

-- Step 3: Primary/unique identifier check
SELECT
    COUNT(*) AS total_customers_raw_rows,
    COUNT(DISTINCT customer_id) AS distinct_customer_ids,
    COUNT(DISTINCT customer_unique_id) AS distinct_customer_unique_ids
FROM raw.customers_raw;

-- Step 4: Check Missing Values
SELECT
    COUNT(*) AS total_customers_raw_rows,
    COUNT(*) - COUNT(customer_id) AS missing_customer_id,
    COUNT(*) - COUNT(customer_unique_id) AS missing_customer_unique_id,
    COUNT(*) - COUNT(customer_zip_code_prefix) AS missing_customer_zip_code_prefix,
    COUNT(*) - COUNT(customer_city) AS missing_customer_city,
    COUNT(*) - COUNT(customer_state) AS missing_customer_state
FROM raw.customers_raw;

-- Step 5: Check for duplicates
-- Check for primary key duplicates (customer_id)
SELECT
    customer_id,
    COUNT(*) AS record_count
FROM raw.customers_raw
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- Check for full row duplicates
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state,
    COUNT(*) AS record_count
FROM raw.customers_raw
GROUP BY customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state
HAVING COUNT(*) > 1;

-- Step 6: Check for data consistency
-- Check for valid city formatting
SELECT DISTINCT customer_city
FROM raw.customers_raw
ORDER BY customer_city;
-- Check for valid state formatting 
SELECT 
    customer_state,
    COUNT(*) AS state_count
FROM raw.customers_raw
GROUP BY customer_state;
-- Check for valid zip code formatting 
SELECT
    LENGTH(customer_zip_code_prefix::TEXT) AS zip_code_length,
    COUNT(*) AS zip_code_count
FROM raw.customers_raw
GROUP BY LENGTH(customer_zip_code_prefix::TEXT) 
ORDER BY zip_code_length;