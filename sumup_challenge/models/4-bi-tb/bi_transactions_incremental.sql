WITH source_data AS (
  SELECT
    t.transaction_id,
    t.device_id,
    t.product_sku,
    t.amount,
    t.status,
    t.is_successful,
    t.transaction_date,
    d.device_type,
    d.store_id,
    s.store_name,
    s.country,
    s.store_typology,
    s.customer_id,
    dd.calendar_year,
    dd.month_of_year,
    dd.day_of_week,
    dd.year_month_key,
    current_timestamp as dbt_updated_at,
    current_timestamp as dbt_inserted_at
  FROM {{ ref('fct_transactions') }} t
  LEFT JOIN {{ ref('dim_devices') }} d ON t.device_id = d.device_id
  LEFT JOIN {{ ref('dim_stores') }} s ON t.store_id = s.store_id
  LEFT JOIN {{ ref('dim_date') }} dd ON t.transaction_date::DATE = dd.date_key
)

SELECT *
FROM source_data

{% if is_incremental() %}
  WHERE 
    transaction_date::TIMESTAMP >= (
      SELECT COALESCE(MAX(transaction_date::TIMESTAMP), '1900-01-01'::TIMESTAMP) 
      FROM {{ this }}
    )
    OR transaction_id NOT IN (
      SELECT transaction_id 
      FROM {{ this }}
    )
{% endif %}
