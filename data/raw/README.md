# Raw Data Layer

This folder contains raw source files used for initial ingestion into the PostgreSQL database.

The raw layer preserves source files exactly as received before any cleaning, transformation, standardisation, or business interpretation.

---

## Raw Layer Purpose

The raw layer is used to:

* preserve source fidelity
* support ingestion validation
* inspect source quality issues
* identify null patterns and duplicates
* prepare controlled movement into staging

---

## Source Fidelity Rule

At raw stage:

* source file names are preserved
* source column names remain unchanged
* source spelling is retained
* no business logic is applied
* no records are modified
* no derived columns are introduced

---

## Dataset Families Included

### 1. Amazon Core Dataset *(Olist Operational Commerce Data)*

Source files loaded from the Amazon Core dataset family include:

* `olist_customers_dataset.csv`
* `olist_geolocation_raw.csv`
* `olist_items_raw.csv`
* `olist_orders_raw.csv`
* `olist_payments_raw.csv`
* `olist_products_raw.csv`
* `olist_reviews_raw.csv`
* `olist_sellers_raw.csv`
* `product_category_name_translation_raw.csv`

**Status:** Fully loaded into PostgreSQL raw schema.

---

### 2. Amazon Products Dataset

Source files planned under the Amazon Products dataset family include:

* `amazon_audio_video_raw.csv`
* `amazon_camera_raw.csv`
* `amazon_cat_accessories_raw.csv`
* `amazon_laptop_raw.csv`
* `amazon_men_raw.csv`
* `amazon_men_shoe_raw.csv`
* `amazon_mobile_raw.csv`
* `amazon_movies_raw.csv`
* `amazon_toys_raw.csv`

**Status:** Pending ingestion.

---

### 3. Amazon Reviews Dataset

Source files planned under the Amazon Reviews dataset family include:

* `amazon_reviews_raw.csv`

**Status:** Pending ingestion.

---

## Loading Method

Raw files are loaded into PostgreSQL using controlled table creation followed by CSV ingestion through terminal-based `psql` commands.

This approach is used to ensure:

* consistent data typing
* successful file ingestion
* encoding control for text-heavy files
* reproducible loading steps

---

## Encoding Note

Text-heavy files may require explicit encoding during ingestion.

Example:

* `LATIN1` used where source text contains special characters

---

## Current Progress

The Amazon Core dataset family has been fully loaded and validated.

The next step is ingestion of Amazon Products and Amazon Reviews before staging begins.
