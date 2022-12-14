--Сессия 1
--Начнем транзакцию
begin transaction isolation level read committed;

--Сессия 2
--Начнем транзакцию
begin transaction isolation level read committed;

--Сессия 1
--Проверка рейтинга
select * from pizzeria where id = 1;

--Сессия 2
--Обновление и коммит
update pizzeria set rating = 3.6 where id = 1;
commit;

--Сессия 1 
--Проверка и коммит
select * from pizzeria where id = 1;
commit;
select * from pizzeria where id = 1;

--Сессия 2
--Проверка данных
select * from pizzeria where id = 1;