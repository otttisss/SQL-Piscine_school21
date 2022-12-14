select action_date, person.name as person_name
from (select order_date as action_date, person_id from person_order
	 intersect
	 select visit_date, person_id from person_visits) as t
inner join person
on person.id = person_id
order by action_date, person_name desc