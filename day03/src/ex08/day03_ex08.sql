insert into menu
values ((select max(id) from menu) + 1,
	(select id from pizzeria where name = 'Dominos'),
	'sicilian pizza', 900);