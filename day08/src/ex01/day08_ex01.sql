--Сессия 1
--Проверка уровня изоляции
show transaction isolation level;

--Сессия 2
--Проверка уровня изоляции
show transaction isolation level;

--Сессия 1
--Начало транзакции
begin;

--Сессия 2
--Начало транзакции
begin;

--Сессия 1 Проверка рейтинга pizza hat
select * from pizzeria where id = 1;

--Сессия 2 Проверка рейтинга pizza hat
select * from pizzeria where id = 1;

--Сессия 1 Зададим новый рейтинг
update pizzeria set rating = 4 where id = 1;

--Сессия 2 Зададим новый рейтинг
update pizzeria set rating = 3.6 where id = 1;

--Сессия 1 публикация изменений
commit;
--Сессия 2 публикация изменений
commit;

--Cессия 1 проверка нового рейтинга
select * from pizzeria where id = 1;
--Сессия 2 проверка нового рейтинга
select * from pizzeria where id = 1;


