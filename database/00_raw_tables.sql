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
    geolocation_lat NUMERIC(10,8), --latitude values need fixed decimal precision --
    geolocation_lng NUMERIC(11,8), --longitude values need fixed decimal precision and a slightly wider range --
    geolocation_city TEXT,
    geolocation_state CHAR(2) -- brazilian states are represented by 2-letter codes, so CHAR(2) is sufficient --
);

SELECT COUNT(*) 
FROM raw.geolocation_raw;

SELECT * 
FROM raw.geolocation_raw 
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.order_items_raw (
    order_id VARCHAR(32), -- olist IDs are fixed hash-like strings --
    order_item_id INTEGER,
    product_id VARCHAR(32), -- olist IDs are fixed hash-like strings --
    seller_id VARCHAR(32),
    shipping_limit_date TIMESTAMP, -- both date and time matter --
    price NUMERIC(10,2), -- currency values should have fixed decimal precision --
    freight_value NUMERIC(10,2) -- currency values should have fixed decimal precision --
);

SELECT COUNT(*) 
FROM raw.order_items_raw;

SELECT * 
FROM raw.order_items_raw 
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.orders_raw (
    order_id VARCHAR(32),
    customer_id VARCHAR(32),
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

SELECT COUNT(*)
FROM raw.orders_raw;

SELECT *
FROM raw.orders_raw
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.payment_raw (
    order_id VARCHAR(32),
    payment_sequential INTEGER, -- the sequence of payments for a given order, starting at 1 --
    payment_type TEXT,
    payment_installments INTEGER, -- they should be whole numbers --
    payment_value NUMERIC(10,2) -- currency values should have fixed decimal precision --
);

SELECT COUNT(*)
FROM raw.payment_raw;

SELECT *
FROM raw.payment_raw
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.products_raw (
    product_id VARCHAR(32),
    product_category_name TEXT,
    product_name_lenght INTEGER, -- kept lenght as in the original dataset for raw fidelity --
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER, -- Measurements --
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

SELECT COUNT(*)
FROM raw.products_raw;

SELECT *
FROM raw.products_raw
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.olist_reviews_raw (
    review_id VARCHAR(32),
    order_id VARCHAR(32),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

SELECT COUNT(*)
FROM raw.olist_reviews_raw;

SELECT *
FROM raw.olist_reviews_raw
LIMIT 10;

CREATE TABLE IF NOT EXISTS raw.sellers_raw (
    seller_id VARCHAR(32),
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state CHAR(2)
);

SELECT COUNT(*)
FROM raw.sellers_raw;

SELECT *
FROM raw.sellers_raw   
LIMIT 10;
