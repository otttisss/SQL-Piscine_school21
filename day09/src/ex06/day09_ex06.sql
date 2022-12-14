create or replace function
	fnc_person_visits_and_eats_on_date(in pperson varchar default 'Dmitriy', pprice numeric default 500,
									  in pdate date default '2022-01-08')
returns varchar as $$
	declare pizzaa_name varchar;
begin
	select piz.name into pizzaa_name
	from person
	join person_visits pv on person.id = pv.person_id
	join person_order po on pv.visit_date = po.order_date
	join menu m on m.id = po.menu_id
	join pizzeria piz on pv.pizzeria_id = piz.id
	where person.name = pperson and m.price < pprice and pv.visit_date = pdate;
	return pizzaa_name;
end;

$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
