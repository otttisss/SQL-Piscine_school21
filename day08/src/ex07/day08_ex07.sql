--Сессия 1
--Начнем транзакцию
begin;

--Сессия 2
--Начнем транзакцию
begin;

--Сессия 1
--Зададим новый возраст клиенту (id = 1)
update person set age = 90 where id = 1;

--Сессия 2
--Зададим новый возраст клиенту (id = 2)
update person set age = 85 where id = 2;

--Сессия 1 
--Зададим новый возраст клиенту (id = 2)
update person set age = 18 where id = 2;

--Сессия 2
--Зададим новый возраст клиенту (id = 1)
update person set age = 21 where id = 1;

--Сессия 1 коммит
commit;

--Сессия 2 коммит
commit;