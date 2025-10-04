-----Average transacted amount per store typology and country-----
SELECT 
    store_typology,
    country,
    round(AVG(amount), 2) as avg_amount
FROM {{ ref('bi_transactions_incremental') }}
GROUP BY 1, 2
ORDER BY 1, 2