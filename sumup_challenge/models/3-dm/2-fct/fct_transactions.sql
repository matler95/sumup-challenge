SELECT
    t.id AS transaction_id,
    t.amount,
    CASE 
        WHEN t.status = 'accepted' THEN TRUE
        ELSE FALSE
    END AS is_accepted_txn,
    t.device_id,
    s.store_id,
    t.product_sku,
    t.happened_at AS transaction_date,
    s.store_name,
    s.country,
    s.typology AS store_typology,
    d.device_type,
    dd.calendar_year,
    dd.month_of_year,
    dd.day_of_week,
    dd.year_month_key
FROM {{ ref('stg_transactions') }} t
JOIN {{ ref('dim_devices') }} d ON t.device_id = d.device_id
JOIN {{ ref('dim_stores') }} s ON d.store_id = s.store_id
JOIN {{ ref('dim_date') }} AS dd ON CAST(t.happened_at AS DATE) = dd.date_key