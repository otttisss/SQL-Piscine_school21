select pr.address, pz.name, count(*) as count_of_orders
from person_order as po
left join person as pr on po.person_id = pr.id
left join menu as me on po.menu_id = me.id
left join pizzeria as pz on me.pizzeria_id = pz.id
group by pr.address, pz.name
order by pr.address, pz.name