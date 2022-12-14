select pz.name as pizzeria_name
from pizzeria as pz
left join person_visits as pv on pz.id = pv.pizzeria_id
where pv.id is null