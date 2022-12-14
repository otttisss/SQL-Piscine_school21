select res.name, count (*) as total_count
from (select pv.pizzeria_id, pz.name
	 from person_visits as pv
	 left join pizzeria as pz on pv.pizzeria_id = pz.id
	 union all
	 select me.pizzeria_id, pz.name
	 from person_order as po
	 left join menu as me on po.menu_id = me.id
	 left join pizzeria as pz on me.pizzeria_id = pz.id) as res
group by res.pizzeria_id, res.name
order by 2 desc