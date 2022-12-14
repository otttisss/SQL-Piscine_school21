select me.pizza_name, me.price, pz.name as pizzeria_name, pv.visit_date
from menu as me
join pizzeria as pz on me.pizzeria_id = pz.id
join person_visits as pv on pz.id = pv.pizzeria_id 
join person as pr on pv.person_id = pr.id
where pr.name = 'Kate' and me.price between 800 and 1000
order by me.pizza_name, me.price, pz.name