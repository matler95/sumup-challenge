
SELECT
    t.transaction_id,
    t.device_id,
    t.product_sku,
    t.category_name,
    t.amount,
    t.status,
    t.card_number,
    t.cvv,
    t.created_at,
    t.transaction_date,
    t.is_successful,
    d.device_type,
    d.store_id,
    s.store_name,
    s.address,
    s.city,
    s.country,
    s.store_created_at,
    s.store_typology,
    s.customer_id
FROM {{ref ('stg_transactions') }} t
JOIN {{ref ('stg_devices') }} d on t.device_id = d.device_id
JOIN {{ref ('stg_stores') }} s on d.store_id = s.store_id
WHERE t.null_device_id = false
AND t.null_sku = false
AND s.null_name = false
AND s.null_country = false
AND s.null_typology = false
AND t.invalid_amount = false
AND t.invalid_status = false
AND t.invalid_dates = false
AND d.invalid_device_type = false
