
SELECT DISTINCT
    store_id,
    store_name,
    store_typology,
    address,
    city,
    country,
    customer_id,
    store_created_at
FROM {{ref ('cln_stores') }}