create table person_audit
(created timestamp with time zone not null default now(),
type_event char(1) default 'I' not null,
row_id bigint not null,
name varchar not null,
age integer not null,
gender varchar not null,
address varchar
constraint ch_type_event check (type_event = 'I' or type_event = 'D' or type_event = 'U'));

create or replace function fnc_trg_person_insert_audit()
	returns trigger as $trg_person_insert_audit$
begin
	if (tg_op = 'INSERT') then
		insert into person_audit select now(), 'I', new.*;
	end if;
	return null;
end;

$trg_person_insert_audit$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person
	for each row execute function fnc_trg_person_insert_audit();
	
insert into person (id, name, age, gender, address)
values
(10, 'Damir', 22, 'male', 'Irkutsk');


