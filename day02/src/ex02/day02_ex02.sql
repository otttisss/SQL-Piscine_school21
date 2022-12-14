select 
	coalesce(pr.name, '-') as person_name,
	pv.visit_date,
	coalesce(pz.name, '-') as pizzeria_name
from person as pr
full join (select * from person_visits
		  where visit_date between '2022-01-01' and '2022-01-03') as pv on pr.id = pv.person_id
full join pizzeria as pz on pv.pizzeria_id = pz.id
order by person_name, pv.visit_date, pizzeria_name