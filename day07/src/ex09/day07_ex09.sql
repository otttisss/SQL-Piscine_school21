select 	res.address, 
		round(res.formula, 2) as formula,
		round(res.average, 2) as average,
		res.formula > res.average as comparison
from (select address,
	 	(max(age)::numeric - ((min(age)::numeric)/max(age)::numeric)) as formula,
	 	avg(age) as average
	 	from person
	 group by address) as res
order by res.address;