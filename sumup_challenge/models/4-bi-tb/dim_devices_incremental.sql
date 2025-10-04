{{
  config(
    unique_key=['device_id']
  )
}}

SELECT
    device_id,
    device_type,
    store_id,
    -- Add metadata for incremental processing
    current_timestamp as dbt_updated_at,
    current_timestamp as dbt_inserted_at
FROM {{ ref('dim_devices') }}

{% if is_incremental() %}
  -- Simplified incremental logic
  WHERE device_id NOT IN (SELECT device_id FROM {{ this }})
{% endif %}
