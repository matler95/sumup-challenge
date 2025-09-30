
SELECT DISTINCT
    id as device_id,
    type as device_type,
    store_id as store_id
FROM {{ref ('stg_devices') }}