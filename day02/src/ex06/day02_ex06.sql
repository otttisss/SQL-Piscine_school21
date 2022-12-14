WITH
CustTab as (select id, name from person
		   	where name in ('Anna', 'Denis')),
OrderTab as (select cs.name as person_name, me.pizza_name, pz.name as pizzeria_name
			from person_order as po
			left join menu as me on po.menu_id = me.id
			left join pizzeria as pz on me.pizzeria_id = pz.id
			left join CustTab as cs on po.person_id = cs.id
			where po.person_id in (select id from CustTab))

select pizza_name, pizzeria_name from OrderTab
where person_name = 'Anna'
		and pizza_name = any(select pizza_name from OrderTab
							where person_name = 'Denis')
union
select pizza_name, pizzeria_name from OrderTab
where person_name = 'Denis'
		and pizza_name = any(select pizza_name from OrderTab
							where person_name = 'Anna')
order by pizza_name, pizzeria_name