select t1.name, t1.lastname, currency_name, money * rate_to_usd as currency_in_usd
from (select coalesce(u.name, '<not defined>') as name,
	 		coalesce(u.lastname, '<not defined>') as lastname,
	 		c.name as currency_name, money,
	 		coalesce((select rate_to_usd
					 from currency c where b.currency_id = c.id and c.updated < b.updated
					 order by c.updated desc limit 1),
					(select rate_to_usd
					from currency c where b.currency_id = c.id and c.updated > b.updated
					order by c.updated asc limit 1)) as rate_to_usd
	 from balance b inner join (select c.id, c.name
							   from currency c
							   group by c.id, c.name) as c on c.id = b.currency_id
	 						   left join "user" u on u.id = b.user_id) as t1
order by 1 desc, 2, 3;
