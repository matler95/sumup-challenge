
SELECT
    id::INT as store_id,
    name as store_name,
    address,
    city,
    country,
	{{timestamp_format('created_at')}} as store_created_at,
    typology as store_typology,
    customer_id::INT as customer_id,
    case 
        when name is null or trim(name) = '' then true 
        else false 
    end as null_name,
    case 
        when country is null or trim(country) = '' then true 
        else false 
    end as null_country,
    case 
        when typology is null or trim(typology) = '' then true 
        else false 
    end as null_typology
FROM {{ref ('raw_stores') }}