create unique index idx_person_order_order_date
	on person_order (person_id, menu_id, order_date)
	where order_date = '2022-01-01';
set enable_seqscan=off;
explain analyze
select person_id, menu_id, order_date from person_order
where order_date = '2022-01-01';