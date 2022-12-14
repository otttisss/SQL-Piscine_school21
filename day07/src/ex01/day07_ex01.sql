select pr.name, count(*) as count_of_visits
from person_visits as pv
left join person as pr on pv.person_id = pr.id
group by pv.person_id, pr.name
order by count_of_visits desc, pr.name
limit 4