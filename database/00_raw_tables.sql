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

CREATE TABLE IF NOT EXISTS raw.order_items_raw (
    order_id VARCHAR(32),
    order_item_id INTEGER,
    product_id VARCHAR(32),
    seller_id VARCHAR(32),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);

SELECT COUNT(*) 
FROM raw.order_items_raw;

SELECT * 
FROM raw.order_items_raw 
LIMIT 10;