# SumUp Senior Analytics Engineer: Take Home Challenge

## Introduction

This project showcases an end-to-end ELT pipeline from data sources to a data warehouse using Python, SQL, and dbt. The solution answers five key business questions about store performance, product sales, and device adoption patterns.

### Business Questions Answered

1. **Top 10 stores by transacted amount** - Identifies the highest-performing stores
2. **Top 10 products sold** - Shows the most popular products by sales volume
3. **Average transacted amount per store typology and country** - Analyzes transaction patterns by store type and location
4. **Percentage of transactions per device type** - Shows device usage distribution
5. **Average time for a store to perform its first 5 transactions** - Measures device adoption speed

## Architecture & Design

### Data Warehouse Choice: DuckDB
- **Fast OLAP performance** for analytical workloads
- **Open source** with excellent Python integration
- **dbt adapter available** for seamless data modeling
- **Cloud-ready** with potential for MotherDuck integration
- **Scalable** for millions to billions of records

### Data Pipeline Architecture

```
Raw Excel Files -> Raw -> Staging -> Cleaning -> Data Marts -> BI Tables -> BI Views
```

#### Layer Structure:
- **0-raw**: Raw data ingestion from Excel files
- **1-stg**: Staging layer with basic transformations
- **2-cln**: Data cleaning and standardization
- **3-dm**: Dimensional modeling (facts and dimensions)
- **4-bi-tb**: Incremental BI tables
- **5-bi-vw**: BI views answering the 5 questions

### Data Model Design

#### Core Entities:
- **Stores**: Physical business locations with typology and country classification
- **Devices**: Hardware (types 1-5) tied to specific stores for transaction processing
- **Transactions**: Card payments in euros for products sold
- **Products**: Items with unique SKU identifiers

#### Key Relationships:
- One-to-many: Store -> Devices
- One-to-many: Device -> Transactions
- Many-to-many: Transaction -> Products (via transaction details)

## Technical Implementation

### Technology Stack
- **dbt Core**: Data transformation and modeling
- **DuckDB**: Analytical database
- **SQL**: All data manipulations (no pandas/notebooks)

### Project Structure
```
sumup_challenge/
├── models/
│   ├── 0-raw/          # Raw data models
│   ├── 1-stg/          # Staging models
│   ├── 2-cln/          # Cleaning models
│   ├── 3-dm/           # Dimensional models
│   ├── 4-bi-tb/        # Incremental BI tables
│   └── 5-bi-vw/        # BI views
├── raw_data/           # Source Excel files
├── macros/             # Custom SQL macros
└── target/             # Compiled and run artifacts
```

## Setup & Execution

### Prerequisites
- Python 3.8+
- PowerShell (Windows)

### Installation Steps

1. **Create virtual environment and install dependencies:**
   ```powershell
   .\vitrualenv.ps1
   ```

2. **Activate dbt environment:**
   ```powershell
   cd sumup_challenge
   .\activate_dbt.ps1
   ```

3. **Run the complete pipeline:**
   ```bash
   dbt run
   ```

4. **Execute BI queries:**
   ```bash
   dbt run --select 5-bi-vw
   ```

5. **Deactivate dbt environment:**
   ```powershell
   cd sumup_challenge
   .\deactivate_dbt.ps1
   ```

### Data Quality Assumptions

**Product Data Quality Issue Identified:**
- Each SKU has multiple product names and categories
- Results in 1500 "unique" products for 1500 transactions
- Some SKUs include prefix
- Card number data in different formats
- **Solution**: SKU is treated as the unique identifier
- Product names and categories are omitted from analysis as they're not directly required
- SKU data and card number data cleaned and normalized

**NULL and invalid values:**
- NULL values in key columns may lower final data quality
- Invalid values (not logical), for example created_at date before happened_at may lower final data quality 
- **Solution**: NULL
- Filtered out NULL and invalid data

## BI Queries

The solution provides 5 SQL views that directly answer the business questions:

1. **`q_1_top_stores.sql`** - Top 10 stores by transaction amount
2. **`q_2_top_products.sql`** - Top 10 products by sales count
3. **`q_3_avg_transaction_amount.sql`** - Average amounts by typology and country
4. **`q_4_transactions_per_device.sql`** - Transaction percentage by device type
5. **`q_5_time_to_five_transactions.sql`** - Average time to reach 5 transactions

## Scalability Considerations

- **Incremental models** for large-scale data processing
- **DuckDB performance** optimized for analytical workloads
- **Modular dbt structure** for maintainable data pipelines
- **Cloud-ready architecture** for future MotherDuck deployment

## Reproducibility

The solution is fully reproducible with:
- Complete dependency management (`requirements.txt`)
- Automated environment setup scripts
- Version-controlled dbt project configuration
- Clear documentation of assumptions and design decisions

## Key Design Decisions

1. **DuckDB over traditional warehouses** for fast analytical processing
2. **Incremental materialization** for BI tables to handle large datasets
3. **SKU-based product identification** to handle data quality issues
4. **Modular dbt architecture** for maintainable data pipelines
5. **Business-focused naming** for clear query identification

## Entity Relationship Diagram (ERD)

### Data Model Overview

Below diagram shows the relationships between core entities in the SumUp data model.

<img width="1047" height="936" alt="data_model" src="https://github.com/user-attachments/assets/47b3a8c1-764b-44d8-b542-0a7d01ef1a7c" />
