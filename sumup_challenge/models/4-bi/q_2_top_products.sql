-----Top 10 products sold-----
SELECT 
    product_sku,
    COUNT(*) as total_sales
FROM {{ ref('fct_transactions') }}
WHERE product_sku IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10