
SELECT
    id::INT as device_id,
    type::INT as device_type,
    store_id::INT as store_id,
    case 
        when store_id is null then true 
        else false 
    end as null_store_id,
    case 
        when type is null then true 
        else false 
    end as null_device_type,
    case 
        when type not in (1, 2, 3, 4, 5) then true 
        else false 
    end as invalid_device_type

FROM {{ref ('raw_devices') }}