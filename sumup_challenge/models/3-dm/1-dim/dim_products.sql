WITH ranked as (
    SELECT DISTINCT product_sku
    FROM {{ ref('cln_transactions') }}
)
SELECT 
    row_number() over (order by product_sku) as product_id,
    product_sku
FROM ranked