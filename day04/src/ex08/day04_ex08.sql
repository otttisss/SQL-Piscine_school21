drop view if exists
v_generated_dates, v_persons_female, v_persons_male,
v_price_with_discount, v_symmetric_union;

drop materialized view if exists mv_dmitriy_visits_and_eats;