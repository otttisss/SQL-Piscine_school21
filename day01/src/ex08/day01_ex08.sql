select order_date as order_date, CONCAT(person.name, '(age:',person.age,')') 
as person_information
from person_order
natural join (select id as person_id, name, age, gender, address from person)
	as person
order by order_date, person_information