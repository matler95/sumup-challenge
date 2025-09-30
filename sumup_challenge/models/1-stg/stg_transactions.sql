
SELECT
    id::INT as transaction_id,
    device_id::INT as device_id,
    product_name,
    {{normalize_int('product_sku')}}::BIGINT as product_sku,
    category_name,
    amount::INT as amount,
    status,
    replace(card_number,' ','')::BIGINT as card_number,
    cvv::INT as cvv,
	{{timestamp_format('created_at')}} as created_at,
	{{timestamp_format('happened_at')}} as transaction_date,
    case 
        when device_id is null then true 
        else false 
    end as null_device_id,
    case 
        when product_sku is null or trim(product_sku) = '' then true 
        else false 
    end as null_sku,
    case 
        when amount::INT < 0 then true 
        when amount is null then true
        else false 
    end as invalid_amount,
    case 
        when status not in ('accepted', 'cancelled', 'refused') then true 
        else false 
    end as invalid_status,
    case 
        when created_at < happened_at then true 
        else false 
    end as invalid_dates,
    case 
        when status = 'accepted' then true 
        else false 
    end as is_successful
FROM {{ref ('raw_transactions') }}