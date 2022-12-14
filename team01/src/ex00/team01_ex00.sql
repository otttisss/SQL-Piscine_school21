select balanced.name, lastname, type, volume,
	coalesce(cur.name, '<not defined>') as currency_name,
	coalesce(rate_to_usd, 1) as last_rate_to_usd,
	volume::numeric * coalesce(rate_to_usd, 1) as total_volume_in_usd
from (select coalesce("user".name, '<not defined>') as name,
	 		coalesce("user".lastname, '<not defined>') as lastname,
	 		type, t1.sum as volume, t1.currency_id
	 from (select user_id, sum(money) as sum,
		  		type, currency_id
		  from balance
		  group by user_id, type, currency_id
		  order by 1) as t1 full join "user" on id = t1.user_id) as balanced
	 full join
	 (select distinct * from currency
	 where updated = (select max(updated) from currency)) as cur
	 on currency_id = cur.id
order by 1 desc, 2, 3;