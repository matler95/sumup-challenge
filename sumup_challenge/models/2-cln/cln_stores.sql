
SELECT
    store_id,
    store_name,
    store_typology,
    address,
    city,
    country,
    customer_id,
	store_created_at
FROM {{ref ('stg_stores') }}
WHERE null_name = false
AND null_country = false
AND null_typology = false