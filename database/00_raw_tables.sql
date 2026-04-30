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

CREATE TABLE IF NOT EXISTS raw.geolocation_raw (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC(10,8),
    geolocation_lng NUMERIC(11,8),
    geolocation_city TEXT,
    geolocation_state CHAR(2)
);

SELECT COUNT(*) 
FROM raw.geolocation_raw;

SELECT * 
FROM raw.geolocation_raw 
LIMIT 10;