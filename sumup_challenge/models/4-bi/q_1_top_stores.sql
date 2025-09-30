-----Top 10 stores by transacted amount-----
SELECT 
    store_id,
    store_name,
    SUM(amount) as total_amount
FROM {{ ref('fct_transactions') }}
WHERE store_id IS NOT NULL
AND is_successful = true
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10