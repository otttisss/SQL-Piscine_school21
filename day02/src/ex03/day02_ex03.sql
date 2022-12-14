WITH Inc_Dates as
(select cast(gs AS date) as missing_date
	from generate_series('2022-01-01', '2022-01-09', interval '1 day') as gs)
select gs.missing_date
	from (select * from person_visits
	 	where person_id = 1 or person_id = 2) as pv
right outer join
Inc_Dates as gs on pv.visit_date = gs.missing_date
where pv.id is null
order by pv.visit_date