select distinct pizza_name as pn, pizzeria_name_1, pizzeria_name_2, menu1.price
from
	(select distinct pizzeria.id as pi1, pizzeria.name as pizzeria_name_1, 
	 menu.pizza_name as pizza_name, price AS price from menu
	join pizzeria on pizzeria.id = menu.pizzeria_id) as menu1
join
	(select pizzeria.id as pi2, pizzeria.name as pizzeria_name_2,
	 menu.pizza_name as pizza_name_2, price as price from menu
	join pizzeria on pizzeria.id = menu.pizzeria_id) 
	as menu2 on menu1.price = menu2.price and menu1.pizza_name = menu2.pizza_name_2
where pi1 > pi2;