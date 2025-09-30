SELECT
    CAST(happened_at AS DATE) AS date_key,

    date_part('year', CAST(happened_at AS TIMESTAMP))  AS calendar_year,
    date_part('month', CAST(happened_at AS TIMESTAMP)) AS month_of_year,
    date_part('day', CAST(happened_at AS TIMESTAMP))   AS day_of_month,
    date_part('dow', CAST(happened_at AS TIMESTAMP))   AS day_of_week,

    strftime(CAST(happened_at AS TIMESTAMP), '%Y-%m')  AS year_month_key,
    strftime(CAST(happened_at AS TIMESTAMP), '%a')     AS day_name_short

FROM {{ ref('dm_transactions') }}
GROUP BY 1,2,3,4,5,6,7
