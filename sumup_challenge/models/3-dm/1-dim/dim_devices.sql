
SELECT DISTINCT
    device_id,
    device_type,
    store_id
FROM {{ref ('cln_devices') }}