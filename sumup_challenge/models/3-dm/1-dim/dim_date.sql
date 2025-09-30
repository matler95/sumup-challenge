SELECT
    transaction_date::DATE as date_key,
    date_part('year', transaction_date::TIMESTAMP) as calendar_year,
    date_part('month', transaction_date::TIMESTAMP) as month_of_year,
    date_part('day', transaction_date::TIMESTAMP) as day_of_month,
    date_part('dow', transaction_date::TIMESTAMP) as day_of_week,
    strftime(transaction_date::TIMESTAMP, '%Y-%m') as year_month_key,
    strftime(transaction_date::TIMESTAMP, '%a') as day_name_short
FROM {{ ref('cln_transactions') }}
GROUP BY 1,2,3,4,5,6,7
