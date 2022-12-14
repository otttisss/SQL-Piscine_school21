select id, name
from person 
union
select id, pizza_name
from menu
order by id, name