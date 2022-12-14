select me.pizza_name, me.price, pz.name as pizzeria_name
from menu as me
left join person_order as po on me.id = po.menu_id
left join pizzeria as pz on me.pizzeria_id = pz.id
where po.id is null 
order by me.pizza_name, me.price