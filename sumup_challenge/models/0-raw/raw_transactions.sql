{{ config(materialized='table') }}

select *
from read_xlsx('{{ project_root }}/raw_data/transactions.xlsx')