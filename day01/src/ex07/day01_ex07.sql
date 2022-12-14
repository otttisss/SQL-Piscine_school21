select order_date as order_date, CONCAT(name, '(age:',age,')') as person_information
from person_order, person
where person_order.person_id = person.id
order by order_date, person_information