-----Top 10 products sold-----
SELECT 
    product_sku,
    COUNT(*) as total_sales
FROM {{ ref('bi_transactions_incremental') }}
WHERE product_sku IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10