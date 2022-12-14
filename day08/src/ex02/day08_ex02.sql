--Сессия 1
--Начнем транзакцию
begin transaction isolation level repeatable read;

--Сессия 2
--Начнем транзакцию 
begin transaction isolation level repeatable read;

--Сессия 1 Проверка рейтинга
select * from pizzeria where id = 1;

--Сессия 2 Проверка рейтинга
select * from pizzeria where id = 1;

--Сессия 1 Обновляем значение рейтинга 
update pizzeria set rating = 4 where id = 1;

--Сессия 2 Обновляем значение рейтинга 
update pizzeria set rating = 3.6 where id = 1;

--Сессия 1 Публикация 
commit;
--Сессия 2 Публикация 
commit;


--Выдает ошибку ERROR:  could not serialize access due to concurrent update
--Ошибка возникла из-за одновременного обновления данных