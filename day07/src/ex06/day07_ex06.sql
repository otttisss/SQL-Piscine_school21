select pz.name, count(*) as count_of_orders,
		round(avg(me.price), 2) as average_price,
		max(me.price) as max_price,
		min(me.price) as min_price
from person_order as po
left join menu as me on po.menu_id = me.id
left join pizzeria as pz on me.pizzeria_id = pz.id
group by pz.id, pz.name
order by pz.name