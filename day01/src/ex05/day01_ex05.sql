select person.id as person_id, person.name as person_name,
	age, gender, address, pizzeria.id as pizzeria_id, 
	pizzeria.name as pizzeria_name, rating
from person, pizzeria
order by person.id, pizzeria.id