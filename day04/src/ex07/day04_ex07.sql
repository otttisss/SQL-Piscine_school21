insert into person_visits
values ((select max(id) from person_visits) + 1,
	   (select id from person where name = 'Dmitriy'),
	   (select pizzeria.id from pizzeria
	   join menu on menu.pizzeria_id = pizzeria.id
	   where pizzeria.name = 'DoDo Pizza' and menu.price < 800),
	   '2022-01-08');
refresh materialized view mv_dmitriy_visits_and_eats;