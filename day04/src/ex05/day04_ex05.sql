create view v_price_with_discount as
	select p.name, m.pizza_name, m.price, round(m.price * 0.9) as discount_price
	from person_order as po
	join person as p
	on po.person_id = p.id
	join menu as m
	on po.menu_id = m.id
order by name, pizza_name;