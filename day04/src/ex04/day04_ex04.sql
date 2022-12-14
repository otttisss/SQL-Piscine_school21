create view v_symmetric_union as
	select pv1.person_id from
	(select * from person_visits
	where visit_date = '2022-01-02') as pv1
	left join
	(select * from person_visits
	where visit_date = '2022-01-06') as pv2 on pv1.person_id = pv2.person_id
where pv2.person_id is null
union all
select pv2.person_id from
	(select * from person_visits
	where visit_date = '2022-01-02') as pv1
	right join
	(select * from person_visits
	where visit_date = '2022-01-06') as pv2 on pv1.person_id = pv2.person_id
where pv1.person_id is null
order by person_id