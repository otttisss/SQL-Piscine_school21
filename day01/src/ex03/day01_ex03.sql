select order_date as action_date, person_id as person_is
from person_order
intersect
select visit_date, person_id
from person_visits
order by action_date, person_is desc