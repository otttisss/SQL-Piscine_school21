WITH table_1 (pizzeria_name) as
(select pz.name as pizziria_name from person p
    join person_visits pv on p.id = pv.person_id
    join pizzeria pz on pv.pizzeria_id = pz.id
    where p.gender = 'male'),
table_2 (pizzeria_name) as
(select pz.name as pizziria_name from person p
    join person_visits pv on p.id = pv.person_id
    join pizzeria pz on pv.pizzeria_id = pz.id
    where p.gender = 'female')
select pizzeria_name from
((select pizzeria_name from table_1 except all (select pizzeria_name from table_2))
union all
(select pizzeria_name from table_2 except all (select pizzeria_name from table_1)))
as tab
order by 1;