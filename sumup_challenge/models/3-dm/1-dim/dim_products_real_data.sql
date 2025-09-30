
WITH 
ranked as (
    SELECT 
    product_sku,
    product_name,
    category_name,
    row_number() over (partition by product_sku, product_name, category_name) as rn
    FROM {{ref ('dm_transactions') }}
)
SELECT 
    md5(product_sku || product_name || category_name)AS product_id,
    product_sku,
    product_name,
    category_name
FROM ranked
WHERE rn = 1