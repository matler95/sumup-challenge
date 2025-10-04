{{
  config(
    unique_key=['product_sku']
  )
}}

SELECT
    product_sku,
    -- Add metadata for incremental processing
    current_timestamp as dbt_updated_at,
    current_timestamp as dbt_inserted_at
FROM {{ ref('dim_products') }}

{% if is_incremental() %}
  -- Simplified incremental logic
  WHERE product_sku NOT IN (SELECT product_sku FROM {{ this }})
{% endif %}
