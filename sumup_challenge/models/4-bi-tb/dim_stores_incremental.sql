{{
  config(
    unique_key=['store_id']
  )
}}

SELECT
    store_id,
    store_name,
    store_typology,
    address,
    city,
    country,
    customer_id,
    store_created_at,
    -- Add metadata for incremental processing
    current_timestamp as dbt_updated_at,
    current_timestamp as dbt_inserted_at
FROM {{ ref('dim_stores') }}

{% if is_incremental() %}
  -- Simplified incremental logic
  WHERE 
    -- New stores
    store_id NOT IN (SELECT store_id FROM {{ this }})
    -- OR stores created after the last run
    OR store_created_at::TIMESTAMP > (
      SELECT COALESCE(MAX(store_created_at::TIMESTAMP), '1900-01-01'::TIMESTAMP) 
      FROM {{ this }}
    )
{% endif %}
