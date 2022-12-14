(select name, count(*) as count, 'order' as action_type
from person_order
	join menu m on m.id = person_order.menu_id
	join pizzeria p on m.pizzeria_id = p.id
	group by name, action_type 
 	order by action_type asc, count desc
	LIMIT 3)
union
(select name, count(*) as count, 'visit' as action_type
from person_visits
	join pizzeria on person_visits.pizzeria_id = pizzeria.id
	group by name, action_type
	order by action_type asc, count desc
	limit 3)
order by 3, 2 desc