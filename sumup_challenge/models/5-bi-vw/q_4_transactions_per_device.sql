-----Percentage of transactions per device type-----
SELECT 
    device_type,
    (ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2))::VARCHAR || '%' as transaction_percentage
FROM {{ ref('bi_transactions_incremental') }}
GROUP BY 1
ORDER BY 2