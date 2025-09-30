
SELECT
    id::INT as id,
    name,
    address,
    city,
    country,
	{{timestamp_format('created_at')}} AS created_at,
    typology,
    customer_id::INT as customer_id
FROM {{ref ('raw_stores') }}