-----Average time for a store to perform its first 5 transactions-----
with ranked as
(
	SELECT
		store_id,
		transaction_date,
		row_number() over (partition by store_id order by transaction_date asc) as rn
		from {{ ref('bi_transactions_incremental') }}
		where is_successful = true
),
first_transaction as 
(
	select 
		store_id,
		transaction_date::TIMESTAMP as first
	from ranked
	where rn = 1
),
fifth_transaction as
(
	select 
		store_id,
		transaction_date::TIMESTAMP as fifth
	from ranked
	where rn = 5
)
select 
    avg(fifth-first) as avg_time_to_fifth_transaction
	FROM first_transaction fst
	JOIN fifth_transaction fth on fst.store_id = fth.store_id
