insert into person_discounts
select row_number() over() as id,
	po.person_id,
	me.pizzeria_id,
	case
		when count(*) = 1 then 10.5
		when count(*) = 2 then 22
		else 30
	end as discount
from person_order as po
left join menu as me on po.menu_id = me.id
group by(po.person_id, me.pizzeria_id);

select * from person_discounts;