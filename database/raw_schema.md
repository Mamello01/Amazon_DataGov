# Amazon Data Governance Database

This database supports a structured data governance portfolio built using Amazon-related datasets organised into multiple dataset families. The objective is to simulate enterprise-grade data management practices by moving from raw ingestion to governed analytical structures.

## Database Purpose

The database is designed to demonstrate:

* raw data ingestion from multiple source files
* schema organisation
* controlled transformation into staging and analytics layers
* data quality assessment
* metadata discipline
* governance-oriented design decisions

The project uses PostgreSQL as the primary database environment.

---

## Schema Structure

The database begins with a raw schema, where source files are loaded exactly as received, without business transformation.

Planned schema layers include:

* raw
* staging
* analytics

---

## Dataset Families

Three related dataset families are maintained within the repository structure.

### 1. Amazon Core Dataset *(Olist Operational Commerce Data)*

This dataset represents transactional e-commerce operations and contains the core business entities required to model customer activity, order processing, logistics, payments, sellers, and product reference data.

Tables currently loaded under this dataset family include:

* customers_raw
* geolocation_raw
* order_items_raw
* orders_raw
* payment_raw
* products_raw
* olist_reviews_raw
* sellers_raw
* product_category_name_translation_raw

**Status:** Active dataset family for current project execution.

---

### 2. Amazon Products Dataset

This dataset family expands product-level information across multiple product categories and supports deeper product governance analysis through category-specific raw ingestion.

Tables available under this dataset family include:

* amazon_audio_video_raw
* amazon_camera_raw
* amazon_cat_accessories_raw
* amazon_laptop_raw
* amazon_men_raw
* amazon_men_shoe_raw
* amazon_mobile_raw
* amazon_movies_raw
* amazon_toys_1_raw

This dataset family supports:

* product metadata profiling
* category consistency checks
* product attribute governance
* cross-category comparison

**Status:** Reserved for future expansion.

---

### 3. Amazon Reviews Dataset

This dataset family contains standalone review-level records intended to extend customer feedback analysis beyond the operational Olist review layer.

Tables available under this dataset family include:

* amazon_reviews_raw

This dataset family supports:

* review quality analysis
* text completeness checks
* customer sentiment exploration
* rating consistency assessment

**Status:** Reserved for future expansion.

---

## Raw Layer Design Principle

The raw schema preserves source fidelity.

This means:

* source column names remain unchanged
* source spelling is preserved
* no business logic is introduced at raw stage
* no primary keys or foreign keys are enforced at raw stage
* data types are selected only to support safe ingestion

---

## Why Raw Comes First

The raw layer allows source data to be audited before transformation.

This makes it possible to:

* inspect source quality
* identify null patterns
* detect duplicates
* validate source consistency
* prepare controlled transformations into staging

---

## Current Progress

The Amazon Core dataset family has been fully loaded into the PostgreSQL raw schema.

Current work now proceeds into staging using the active core dataset family.
