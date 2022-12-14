--Сессия 1
--Обновление рейтинга pizza hut
BEGIN;
UPDATE pizzeria SET rating = 5 where id = 1;

--Проверка изменений в сессии 1
select * from pizzeria where id = 1;

--Сессия 2
--Проверить отсутсвие изменений в сессии 2
select * from pizzeria where id = 1;

--Опубликовать измнения в сессии 1
COMMIT;

--Сессия 2
--Проверить изменения в сессии 2
select * from pizzeria where id = 1;