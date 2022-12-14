WITH JoinTab as
(select me.pizzeria_id, pr.gender
from person_order as po
left join person as pr on po.person_id = pr.id
left join menu as me on po.menu_id = me.id)

select pz.name as pizzeria_name
from pizzeria as pz
where (select count(1) from JoinTab where pizzeria_id = pz.id) = 
	(select count(1) from JoinTab where pizzeria_id = pz.id and gender = 'female')
	and (select count(1) from JoinTab where pizzeria_id = pz.id) > 0
union
select pz.name as pizzeria_name
from pizzeria as pz
where (select count(1) from JoinTab where pizzeria_id = pz.id) = 
	(select count(1) from JoinTab where pizzeria_id = pz.id and gender = 'male')
	and (select count(1) from JoinTab where pizzeria_id = pz.id) > 0
order by pizzeria_name