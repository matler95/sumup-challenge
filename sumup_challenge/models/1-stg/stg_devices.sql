
SELECT
    id::INT as id,
    type::INT as type,
    store_id::INT as store_id
FROM {{ref ('raw_devices') }}