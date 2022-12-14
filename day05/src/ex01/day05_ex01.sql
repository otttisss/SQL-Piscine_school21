set enable_seqscan=off;
explain analyze
select me.pizza_name, pz.name as pizzeria_name
from menu as me
left join pizzeria as pz on me.pizzeria_id = pz.id