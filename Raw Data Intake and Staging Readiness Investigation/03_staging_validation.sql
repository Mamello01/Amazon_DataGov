-- STAGING VALIDATION
-- This file will be used to validate the staging tables created in create_staging_tables.sql.
-- The validation process includes checks for row counts, data integrity, formatting consistency, and constraint adherence

-- Step 1: Row count validation
-- Confirms that staging preserved the same number of records as the raw table.
SELECT
    'raw.customers_raw' AS table_name,
    COUNT(*) AS total_rows
FROM raw.customers_raw
UNION ALL
SELECT
    'staging.customers' AS table_name,
    COUNT(*) AS total_rows
FROM staging.customers;


-- Step 2: Identifier validation
-- Confirms that customer_id remains unique and customer_unique_id repeats as expected.
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS distinct_customer_ids,
    COUNT(DISTINCT customer_unique_id) AS distinct_customer_unique_ids
FROM staging.customers;


-- Step 3: Primary key duplicate validation
-- Should return no rows.
SELECT
    customer_id,
    COUNT(*) AS record_count
FROM staging.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Step 4: NULL validation
-- Confirms that staging did not introduce missing values.
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(customer_id) AS missing_customer_id,
    COUNT(*) - COUNT(customer_unique_id) AS missing_customer_unique_id,
    COUNT(*) - COUNT(zip_code_prefix) AS missing_zip_code_prefix,
    COUNT(*) - COUNT(customer_city) AS missing_customer_city,
    COUNT(*) - COUNT(customer_state) AS missing_customer_state
FROM staging.customers;


-- Step 5: City formatting validation
-- Should return 0 if all city values are lowercase and trimmed.
SELECT
    COUNT(*) AS invalid_city_format_count
FROM staging.customers
WHERE customer_city <> LOWER(TRIM(customer_city));


-- Step 6: State formatting validation
-- Should return 0 if all state values are uppercase, trimmed, and two characters long.
SELECT
    COUNT(*) AS invalid_state_format_count
FROM staging.customers
WHERE customer_state <> UPPER(TRIM(customer_state))
   OR LENGTH(customer_state) <> 2;


-- Step 7: ZIP code formatting validation
-- Should show only zip_code_length = 5.
SELECT
    LENGTH(zip_code_prefix) AS zip_code_length,
    COUNT(*) AS record_count
FROM staging.customers
GROUP BY LENGTH(zip_code_prefix)
ORDER BY zip_code_length;


-- Step 8: Constraint validation summary
-- Confirms there are no records violating the business rules enforced in staging.
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null_violations,
    SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS customer_unique_id_null_violations,
    SUM(CASE WHEN zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS zip_code_prefix_null_violations,
    SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS customer_city_null_violations,
    SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS customer_state_null_violations,
    SUM(CASE WHEN LENGTH(customer_state) <> 2 THEN 1 ELSE 0 END) AS state_length_violations,
    SUM(CASE WHEN LENGTH(zip_code_prefix) <> 5 THEN 1 ELSE 0 END) AS zip_code_length_violations
FROM staging.customers;


-- Step 9: Relationship readiness validation
-- Confirms customer_id remains available as a stable join key for future orders staging.
SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS populated_customer_ids,
    COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM staging.customers;
