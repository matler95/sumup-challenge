{{
  config(
    unique_key=['transaction_id']
  )
}}

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
    calendar_year,
    month_of_year,
    day_of_week,
    year_month_key,
    -- Add metadata for incremental processing
    current_timestamp as dbt_updated_at,
    current_timestamp as dbt_inserted_at
FROM {{ ref('fct_transactions') }}

{% if is_incremental() %}
  -- Simplified incremental logic
  WHERE 
    -- New transactions (by business date)
    transaction_date::TIMESTAMP >= (
      SELECT COALESCE(MAX(transaction_date::TIMESTAMP), '1900-01-01'::TIMESTAMP) 
      FROM {{ this }}
    )
    -- OR completely new transaction IDs
    OR transaction_id NOT IN (SELECT transaction_id FROM {{ this }})
{% endif %}
