-- CREATE STAGING TABLES
-- This file will be used to clean tables and create staging tables for the data processing pipeline. 
-- The staging tables will be designed to hold cleaned and transformed data that is ready for analysis.

-- CREATE STAGING TABLE: customers
-- 1. All columns are explicitly cast to TEXT to ensure consistent data types 
-- and avoid implicit casting issues in downstream joins and transformations.
-- 2. TRIM() is applied to all fields to remove hidden leading or trailing spaces 
-- that could break joins or create duplicate-like values.
CREATE TABLE IF NOT EXISTS staging.customers AS
SELECT 
    TRIM(customer_id::TEXT) AS customer_id,
    TRIM(customer_unique_id::TEXT) AS customer_unique_id,
    TRIM(customer_zip_code_prefix::TEXT) AS zip_code_prefix,
    TRIM(LOWER(customer_city::TEXT)) AS customer_city,
    TRIM(UPPER(customer_state::TEXT)) AS customer_state
FROM raw.customers_raw;

-- customer_id is the staged table"s primary key because it is complete, unique, and stable. 
-- It is the most suitable identifier for joins and transformations in the data processing pipeline.
ALTER TABLE staging.customers
ADD CONSTRAINT pk_customers 
PRIMARY KEY (customer_id);

-- Since all fields showed no missing values, the next step is to enforce
-- NOT NULL constraints on all columns to ensure data integrity and prevent future issues with missing data.
ALTER TABLE staging.customers
ALTER COLUMN customer_id SET NOT NULL,
ALTER COLUMN customer_unique_id SET NOT NULL,
ALTER COLUMN zip_code_prefix SET NOT NULL,  
ALTER COLUMN customer_city SET NOT NULL,
ALTER COLUMN customer_state SET NOT NULL;

-- state code should be a two-letter abbreviation, so we can enforce this with a CHECK constraint to ensure data quality and consistency.
ALTER TABLE staging.customers
ADD CONSTRAINT chk_customer_state_length
CHECK (LENGTH(customer_state) = 2);

-- ZIP code prefixes should be 5 digits, so we can enforce this with a CHECK constraint to ensure data quality and consistency.
ALTER TABLE staging.customers
ADD CONSTRAINT chk_zip_code_prefix_length
CHECK (LENGTH(zip_code_prefix) = 5);

