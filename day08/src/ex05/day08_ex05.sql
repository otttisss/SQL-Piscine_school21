--Сессия 1
--Начнем транзакцию
begin transaction isolation level read committed;

--Сессия 2
--Начнем транзакцию
begin transaction isolation level read committed;

--Сессия 1
--Проверка суммы рейтингов всех пиццерий
select sum(rating) from pizzeria;

--Сессия 2
--Обновление рейтинга и коммит
update pizzeria set rating = 3.0 where id = 1;
commit;

--Сессия 1 
--Проверка сумм и коммит
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--Сессия 2
--Проверка сумм
select sum(rating) from pizzeria;