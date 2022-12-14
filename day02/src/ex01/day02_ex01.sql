select cast(gs AS date) as missing_date
from (select * from person_visits
	 where person_id = 1 or person_id = 2) as pv
right outer join
generate_series('2022-01-01', '2022-01-09', interval '1 day') as gs on pv.visit_date = cast(gs as date)
where pv.id is null
order by pv.visit_date