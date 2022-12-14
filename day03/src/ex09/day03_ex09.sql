insert into person_visits (id, person_id, pizzeria_id, visit_date)
values ((select max(id) from person_visits) + 1,
	   (select id from person where name = 'Denis'),
	   (select id from pizzeria where name = 'Dominos'), '2022-02-24');

insert into person_visits (id, person_id, pizzeria_id, visit_date)
values ((select max(id) from person_visits) + 1,
	   (select id from person where name = 'Irina'),
	   (select id from pizzeria where name = 'Dominos'), '2022-02-24');