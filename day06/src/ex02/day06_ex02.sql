select pr.name, me.pizza_name, me.price,
	(((me.price * 100) - (me.price * pd.discount)) / 100) as discount_price,
	pi.name as pizzeria_name
from person_order as po
left join menu as me on po.menu_id = me.id
left join person as pr on po.person_id = pr.id
left join person_discounts as pd on po.person_id = pd.person_id and me.pizzeria_id = pd.pizzeria_id
left join pizzeria as pi on pd.pizzeria_id = pi.id
order by pr.name, me.pizza_name