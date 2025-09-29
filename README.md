SumUp Senior Analytics Engineer: Take Home Challenge

Introduction
The goal of this technical test is to showcase an end-to-end ELT pipeline from a
data source to any data warehouse using Python, SQL, and dbt with data models
to answer the following questions:
Top 10 stores by transacted amount
Top 10 products sold
Average transacted amount per store typology and country
Percentage of transactions per device type
Average time for a store to perform its first 5 transactions

Assumptions
Each customer has one or multiple stores, which are physical locations where
their business happens. These stores are classified by different typologies.
We provide customers with different types of devices (1 to 5). These devices
are hardware needed to perform transactions and are each tied to a specific
store.
A transaction is a payment made using the provided devices. Currently, our
devices only handle card payments in euros. These transactions are made to
pay for products sold inside the store. Each product has a name and a SKU
(stock keeping unit), which is unique.
Every day, our customers' customers visit their favorite stores to buy products
and pay for them using the devices we provide.

-----------------
Data Flow:
raw xlsx seeds -> dbt staging -> dbt prepub -> dbt pub -> push to duckdb -> push to motherduck

1. Research data warehouse suitable for this task
    DuckDB - fast, opensource, Python integration, dbt adapter available, OLAP - for analytics, potential to push data to cloud (MotherDuck)
2. prepare requirements.txt for python .venv setup
    dbt, adapters, environment variable management, etc
3. start .gitignore
4. run virtualenv.ps1
5. init dbt project
....
x. to run:
    * run .\virtualenv.ps1 - create .venv, install dependencies
