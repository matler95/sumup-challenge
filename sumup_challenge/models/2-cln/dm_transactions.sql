
SELECT
    id,
    device_id,
    product_name,
    product_sku,
    category_name,
    amount,
    status,
    card_number,
    cvv,
	created_at,
	happened_at
FROM {{ref ('stg_transactions') }}
WHERE happened_at < created_at