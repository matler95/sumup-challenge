
SELECT
    id::INT as id,
    device_id::INT as device_id,
    product_name,
    {{normalize_int('product_sku')}}::BIGINT as product_sku,
    category_name,
    amount::INT as amount,
    status,
    replace(card_number,' ','')::BIGINT as card_number,
    cvv::INT as cvv,
	{{timestamp_format('created_at')}} AS created_at,
	{{timestamp_format('happened_at')}} AS happened_at
FROM {{ref ('raw_transactions') }}