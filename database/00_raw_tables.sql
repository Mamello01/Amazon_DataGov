CREATE TABLE IF NOT EXISTS raw.customers_raw (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

SELECT COUNT(*)
FROM raw.customers_raw;

SELECT *
FROM raw.customers_raw
LIMIT 5;

