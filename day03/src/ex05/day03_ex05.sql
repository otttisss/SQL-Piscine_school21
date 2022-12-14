select distinct(pva.pizzeria_name)
from (select pv.pizzeria_id, pz.name as pizzeria_name
	 from person_visits as pv
	 left join person as pr on pv.person_id = pr.id
	 left join pizzeria as pz on pv.pizzeria_id = pz.id
	 where pr.name = 'Andrey') as pva
left join (select me.pizzeria_id
		  from person_order as po
		  left join person as pr on po.person_id = pr.id
		  left join menu as me on po.menu_id = me.id
		  where pr.name = 'Andrey') as poa on pva.pizzeria_id = poa.pizzeria_id
where poa.pizzeria_id is null
order by pva.pizzeria_name