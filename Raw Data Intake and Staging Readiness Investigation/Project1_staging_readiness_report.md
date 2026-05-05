# Project 1: Raw Data Intake and Staging Readiness Report  

## Table: customers_raw

---

## Introduction

This report presents the results of a **data governance investigation** conducted on the `customers_raw` table as part of the **Raw Data Intake and Staging Readiness Investigation**.

The objective of this report is to:

- assess the **structural integrity** of the raw dataset  
- identify any **data quality risks** that may affect staging  
- define and apply **controlled staging transformations**  
- validate that the staged data is **reliable for downstream use**

This investigation follows a structured governance approach:

> **Profile → Design → Transform → Validate → Assess**

---

## 1. Raw Table Profiling Summary

The `customers_raw` table was profiled to assess structural integrity, completeness, and readiness for controlled staging.

### **Row Count**

The table contains **99,441 records**, indicating a complete and successfully ingested dataset.

### **Column Structure**

All expected columns were present:

- `customer_id`  
- `customer_unique_id`  
- `customer_zip_code_prefix`  
- `customer_city`  
- `customer_state`  

The structure aligns with expected ecommerce customer data.

### **Identifier Assessment**

- **`customer_id`** is **unique across all records** and contains no NULL values  
- **`customer_unique_id`** is **not unique**, with **96,096 distinct values**

This confirms:

- `customer_id` represents a **record-level identifier**  
- `customer_unique_id` represents a **customer-level identity**

### **Missing Values**

No missing values were identified across any column.  
All fields are fully populated.

### **Duplicate Records**

- No duplicate `customer_id` values were found  
- No full-row duplicates were identified  

This indicates clean ingestion and no duplication issues.

### **Data Formatting**

- `customer_city` values are consistently stored in **lowercase**  
- `customer_state` values are stored as **uppercase two-letter abbreviations**  
- `customer_zip_code_prefix` values are consistently **5 characters long**  

Overall, formatting is consistent and suitable for staging.

---

## 2. Staging Design Decisions

Although the raw table is structurally strong, controlled staging is required to enforce consistency, clarity, and downstream reliability.

### **Data Type Control**

All fields were explicitly cast to **TEXT** to ensure consistent typing and avoid implicit casting issues during joins and transformations.

### **Whitespace Standardisation**

`TRIM()` was applied to all columns to remove hidden leading and trailing spaces that could impact joins or create inconsistent values.

### **Naming Consistency**

`customer_zip_code_prefix` was renamed to **`zip_code_prefix`** to improve readability and reduce redundancy within the customers table.

### **City Standardisation**

`customer_city` was retained in **lowercase format** to preserve consistency and support stable joins with geolocation data.

### **State Standardisation**

`customer_state` was standardised to **uppercase** to enforce consistent two-letter state abbreviations.

### **Key Design**

- `customer_id` is defined as the **primary key** due to its uniqueness and completeness  
- `customer_unique_id` is preserved as a **repeatable customer-level identifier**  

---

## 3. Staging Table Creation

A new table, **`staging.customers`**, was created using the defined staging transformations.

The staging table preserves all raw records while applying:

- explicit data typing  
- controlled naming  
- standardised formatting  
- enforced constraints  

Additional constraints applied:

- **Primary key** on `customer_id`  
- **NOT NULL constraints** on all columns  
- **CHECK constraint** enforcing state length = 2  
- **CHECK constraint** enforcing ZIP prefix length = 5  

---

## 4. Staging Validation

The staging table was validated to ensure transformation integrity.

### **Row Count Validation**

Row count remains **99,441**, confirming no unintended data loss.

### **Identifier Validation**

- `customer_id` remains **unique**  
- `customer_unique_id` continues to **repeat as expected**  

### **Null Validation**

No NULL values were introduced during transformation.

### **Format Validation**

- All city values remain **lowercase**  
- All state values are **uppercase**  
- ZIP prefix length remains consistent at **5 characters**  

The staging process successfully preserved data integrity while enforcing control.

---

## 5. Final Governance Assessment

| **Area** | **Assessment** |
| --------- | -------------- |
| Row Count | 99,441 records confirmed |
| Identifier Uniqueness | `customer_id` is unique |
| Repeated Customer Identity | `customer_unique_id` repeats as expected |
| Missing Values | None |
| Duplicate Records | None |
| ZIP Formatting | Consistent 5-character prefix |
| City Formatting | Consistently lowercase |
| State Formatting | Consistent uppercase abbreviations |

---

## Governance Conclusion

The `customers_raw` dataset demonstrates **high structural quality and strong staging readiness**.

Controlled staging was applied not to correct errors, but to:

- enforce consistency  
- standardise structure  
- prepare for reliable downstream joins and transformations  

The resulting **`staging.customers`** table is fully prepared for integration into subsequent data governance processes.
