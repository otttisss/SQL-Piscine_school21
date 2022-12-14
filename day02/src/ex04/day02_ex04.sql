select me.pizza_name, pz.name as pizzeria_name, me.price
from menu as me
left join pizzeria as pz on me.pizzeria_id = pz.id
where pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by me.pizza_name, pizzeria_name