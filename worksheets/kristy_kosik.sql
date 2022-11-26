create or replace table kosik_vazebni(csu_id int, kosik_id int,UNIT_PRICE_MULTIPLIER float);

insert into kosik_vazebni
select distinct 114202 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --mléko
from V_KOSIK_STALE_PRODUKTY
where "itemName" ilike '%mléko%' and "itemName" ilike '%polotučné%' 
and "itemName" ilike '%trvanlivé%' and "breadCrumbs" ilike '%mléko a mléčné%'
and "itemName" not like '%Lipánek%'
limit 100;


insert into kosik_vazebni
select distinct 112707 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --vepřová šunka
from V_KOSIK_STALE_PRODUKTY
where "itemName" ilike '%šunka%' and "itemName" ilike '%vepřová%' 
limit 100;


insert into kosik_vazebni
select distinct 114701 as csu_id, cast("ID" as int) kosik_id, 10 as UNIT_PRICE_MULTIPLIER  --slepičí vejce 10ks
from v_kosik_stale_produkty
where "itemName" ilike '%vejce%' and "breadCrumbs"  ilike '%vejce%'and "itemName" not like '%30%' 
and "itemName" not like '%36%' and "itemName" not like '%6%' and "itemName" not like '%18%' and "itemName" not like '%15%'
and "itemName" not like '%Křepelčí%'
limit 100;


insert into kosik_vazebni
select distinct 111201 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --hladká mouka pšeničná
from v_kosik_stale_produkty
where "itemName" ilike '%mouka%' and "itemName" ilike '%hladká%' and "itemName" ilike '%pšeničná%'
limit 100;


insert into kosik_vazebni
select distinct 115101  as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --máslo
from v_kosik_stale_produkty
where "itemName" ilike '%máslo%' and "itemName" not like '%lanýž%' and "itemName" not like '%kozí%' 
and "itemName" not like '%bylinné' 
and "itemName" not like '%Bylinkové%' and "itemName" not like '%Přepuštěné%' and "breadCrumbs" ilike '%máslo%'
and "itemName" not like '%Hera%' and"itemName" not like '%Rama%' and"itemName" not like '%Perla%'
and "itemName" not like '%Zlatá%'and "itemName" not like '%Omega%'
and "itemName" not like '%Roztíratelné%'and "itemName" not like '%Kozí%'and "itemName" not like '%přepuštěné%'
and "itemName" not like '%Kokosové%'
limit 100;


insert into kosik_vazebni
select distinct 117401 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --brambory konzumní
from v_kosik_stale_produkty
where "itemName" ilike '%brambory%' and "itemName" ilike '%konzumní%' and "itemName" not like '%krájené%'and "itemName" not like '%loupané%'
limit 100;


insert into kosik_vazebni
select distinct 118101 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --cukr krystal
from v_kosik_stale_produkty
where "itemName" ilike '%Cukr%' and "itemName" ilike '%Krystal%' 
or "itemName" ilike '%krystalový%' and "breadCrumbs" ilike '%Trvanlivé%'
limit 100;


insert into kosik_vazebni
select distinct 112101 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  --hovězí zadní bez kosti
from v_kosik_stale_produkty
where "itemName" ilike '%Hovězí%'and "itemName" ilike '%Zadní%' 
limit 100;

insert into kosik_vazebni
select distinct 117108 as csu_id, cast("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER -- cibule suchá
from v_kosik_stale_produkty
where "itemName" ilike '%cibule%'and "breadCrumbs" ilike '%zelenina%'
limit 100;

insert into kosik_vazebni
select distinct 211101 as csu_id, cast ("ID" as int) kosik_id, 1 as UNIT_PRICE_MULTIPLIER  -- tuzemák
from v_kosik_stale_produkty
where "itemName" ilike '%Tuzemský%' or"itemName" ilike '%Tuzemák%' and "breadCrumbs" ilike '%Rumy%'
limit 100;


insert into kosik_vazebni
select distinct 213201 as csu_id, cast ("ID" as int) kosik_id, 0.5 as UNIT_PRICE_MULTIPLIER  -- pivo, světlé, lahvové
from v_kosik_stale_produkty
where "itemName" ilike '%ležák%' and "itemName" ilike '%světlý%' and "itemName" ilike '%sklo%' and "itemName" not like '%8x%'
limit 100;


-- select csu_id, count(*) from kosik_vazebni
-- group by csu_id




