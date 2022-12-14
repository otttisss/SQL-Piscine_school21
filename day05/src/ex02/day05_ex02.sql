create index idx_person_name on person (upper(name));

set enable_seqscan=off;
explain analyze
select * from person where upper(name) = 'IRINA'