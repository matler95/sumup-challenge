
SELECT
    device_id,
    device_type,
    store_id
FROM {{ref ('stg_devices') }}
WHERE null_store_id = false
AND null_device_type = false
AND invalid_device_type = false