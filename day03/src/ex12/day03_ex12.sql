insert into person_order(id, person_id, menu_id, order_date)
select gs, pr.id, 
	(select id from menu where pizza_name = 'greek pizza'),
	'2022-02-25'
from generate_series((select max(id) from person_order) + 1,
		(select max(id) from person_order) + (select count(1) from person)) as gs
left join person as pr on (gs - (select max(id) from person_order)) = pr.id