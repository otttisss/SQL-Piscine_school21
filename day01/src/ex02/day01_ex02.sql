select pizza_name
from (select *,
	  ROW_NUMBER() OVER (PARTITION BY pizza_name) SortOrder
	 from menu) as row_num
where row_num.SortOrder = 1
order by pizza_name desc