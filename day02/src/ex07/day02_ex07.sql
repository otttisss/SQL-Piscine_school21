select distinct pz
from (select pizzeria.name as pz, pizzeria_id as pi	from person_visits
	 left join person on person.id = person_id
	 left join pizzeria on pizzeria.id = pizzeria_id
	 where person.name = 'Dmitriy' and visit_date = '2022-01-08') as t1
left join menu on menu.pizzeria_id = pi
where menu.price < 800