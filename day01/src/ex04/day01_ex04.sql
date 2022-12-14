select person_id
from person_order
where order_date = '01-07-2022'
except all
select person_id
from person_visits
where visit_date = '01-07-2022'