select gd.generated_date as missing_date
from person_visits as pv
right outer join v_generated_dates as gd on pv.visit_date = gd.generated_date
where pv.id is null
order by missing_date