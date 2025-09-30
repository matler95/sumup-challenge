{{ config(materialized='table') }}

select *
from read_xlsx('raw_data/devices.xlsx')
