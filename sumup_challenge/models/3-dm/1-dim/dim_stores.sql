
SELECT DISTINCT
    id as store_id,
    customer_id,
    name as store_name,
    address,
    city,
    country,
    typology,
    created_at
FROM {{ref ('stg_stores') }}