select pr.name, count(*) as count_of_visits
from person_visits as pv
left join person as pr on pv.person_id = pr.id
group by pr.id, pr.name
having count(*) > 3