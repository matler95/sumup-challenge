SELECT
    transaction_id,
    device_id,
    device_type,
    store_id,
    product_sku,
    amount,
    status,
    is_successful,
    store_name,
    country,
    store_typology,
    transaction_date,
    dd.calendar_year,
    dd.month_of_year,
    dd.day_of_week,
    dd.year_month_key
FROM {{ ref('cln_transactions') }} t
JOIN {{ ref('dim_date') }} dd on t.transaction_date::DATE = dd.date_key