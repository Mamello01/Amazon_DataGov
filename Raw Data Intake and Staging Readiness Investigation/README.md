# Project 1: Raw Data Intake and Staging Readiness Investigation

## Investigation Title

Raw Data Intake and Controlled Staging for Amazon Core Ecommerce Data

---

## Investigation Context

An ecommerce organisation operates through multiple transactional source files covering customers, orders, payments, products, sellers, reviews, and geographic reference data.

The source data exists in raw form and has been loaded into a controlled relational environment for governance assessment.

Before the organisation can rely on this data for reporting, operational analysis, or governance controls, the raw source must first be investigated to determine whether it is structurally suitable for controlled staging.

This investigation focuses on the earliest governance question in the data lifecycle:

Can raw operational data be trusted enough to move into a controlled staging layer?

---

## Business Problem Simulated

The organisation receives raw operational extracts from multiple source systems.

The extracts are not yet trusted for direct business use because:

- source structures may differ  
- fields may contain missing values  
- duplicates may exist  
- column formats may not align  
- date fields may not be consistent  
- identifiers may not behave reliably across tables  

If these issues are not identified early, later governance controls become weak.

---

## Core Governance Question

What structural conditions in the raw source data may weaken controlled staging and downstream governance readiness?

---

## Investigation Purpose

This investigation seeks to determine whether the raw ecommerce source data is structurally ready for controlled staging while preserving source integrity.

The focus is not business analysis.

The focus is structural trust.

---

## Source Scope

The investigation covers raw operational tables representing:

- customers  
- geolocation  
- orders  
- order items  
- payments  
- products  
- reviews  
- sellers  
- category mappings  

---

## Primary Investigation Questions

### Structural Integrity Questions

1. Are all source tables readable and structurally complete?

2. Do all tables contain the expected columns?

3. Are column names consistent enough to support controlled staging?

4. Which tables contain structural irregularities?

5. Are there columns whose meaning is unclear or potentially unstable?

---

### Completeness Questions

1. Which tables contain visible missing values?

2. Which fields appear most incomplete?

3. Are missing values concentrated in key identifiers or descriptive fields?

4. Which tables may weaken staging reliability because of incomplete records?

---

### Identifier Questions

1. Which source tables contain natural identifiers?

2. Are identifiers unique where expected?

3. Do duplicate identifiers appear in tables that should behave uniquely?

4. Which identifiers may create staging risk if left unchecked?

---

### Formatting Questions

1. Which columns require type standardisation before staging?

2. Are date fields stored consistently?

3. Are text fields uniformly formatted?

4. Which fields may require controlled transformation before they become usable?

---

### Cross-Table Readiness Questions

1. Can the raw tables logically support joins?

2. Are key relationships visible across tables?

3. Which tables may weaken downstream linkage because of inconsistent identifiers?

4. Are there early signs of orphan records?

---

## Governance Risk Focus

The investigation must identify risks that may affect later governance work, including:

- unstable identifiers  
- structural inconsistency  
- weak field completeness  
- transformation ambiguity  
- unreliable table relationships  

---

## Expected Governance Outcome

At the end of this investigation, the organisation should understand:

- whether the raw source is structurally trustworthy  
- where staging risk exists  
- which tables require the most control before movement into staging  

---

## Position in Portfolio

This investigation is the first governance project in a connected portfolio.

It establishes the structural trust required before deeper governance work begins.

Later investigations will move into:

- quality control  
- audit scoring  
- lineage tracking  
- compliance monitoring  
- metadata governance  

---
