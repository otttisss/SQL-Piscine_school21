create or replace function fnc_fibonacci(in pstop int default 10)
	returns setof int as $$
begin
	return query (with recursive fibonacci(num, prev) as
				 (select 0, 1
				 union all
				 select fibonacci.num + fibonacci.prev, fibonacci.num
				 from fibonacci
				 where fibonacci.num < pstop - fibonacci.prev)
				 select num from fibonacci);
end;
$$ language plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();