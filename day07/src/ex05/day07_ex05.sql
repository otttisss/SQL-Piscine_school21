select pr.name from person as pr
where exists (select 1 from person_order
			 where person_id = pr.id)
order by pr.name