create or replace table itesco_vazebni(csu_id int, itesco_id int, UNIT_PRICE_MULTIPLIER float);

insert into itesco_vazebni
select 
    distinct 114202 as csu_id, 
    cast(ID as int), 
    1 as UNIT_PRICE_MULTIPLIER   --mléko
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%mléko%' and "itemName" ilike '%polotučné%' and "itemName" not like '%Sušené%'; 


insert into itesco_vazebni
select distinct 112707 as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER  --vepřová šunka
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%šunka%' and "itemName" ilike '%vepřová%';



insert into itesco_vazebni
select distinct 114701 as csu_id, cast("ID" as int) itesco_id, 10 as UNIT_PRICE_MULTIPLIER --slepičí vejce 10ks 
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%vejce%' and "breadCrumbs"  ilike '%vejce%'and "itemName" not like '%30%' 
and "itemName" not like '%36%' and "itemName" not like '%6%' and "itemName" not like '%18%' and "itemName" not like '%15%'
and "itemName" not like '%Křepelčí%';


insert into itesco_vazebni
select distinct 111201 as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER--hladká mouka pšeničná
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%mouka%' and "itemName" ilike '%hladká%' and "itemName" ilike '%pšeničná%';


insert into itesco_vazebni
select distinct 115101  as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER --máslo
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%máslo%' and "itemName" not like '%lanýž%' and "itemName" not like '%kozí%' 
and "itemName" not like '%bylinné' 
and "itemName" not like '%Bylinkové%' and "itemName" not like '%Přepuštěné%' and "breadCrumbs" ilike '%máslo%'
and "itemName" not like '%Hera%' and"itemName" not like '%Rama%' and"itemName" not like '%Perla%'
and "itemName" not like '%Zlatá%'and "itemName" not like '%Omega%'
and "itemName" not like '%Roztíratelné%'and "itemName" not like '%Kozí%'and "itemName" not like '%přepuštěné%'
and "itemName" not like '%Kokosové%';



insert into itesco_vazebni
select distinct 117401 as csu_id, cast("ID" as int) itesco_id,1 as UNIT_PRICE_MULTIPLIER  --brambory konzumní
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%brambory%' and "itemName" ilike '%konzumní%' and "itemName" not like '%krájené%'and "itemName" not like '%loupané%';


insert into itesco_vazebni
select distinct 118101 as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER --cukr krystal
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%Cukr%' and "itemName" ilike '%Krystal%' 
or "itemName" ilike '%krystalový%' and "breadCrumbs" ilike '%Trvanlivé%';


insert into itesco_vazebni
select distinct 112101 as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER--hovězí zadní bez kosti
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%Hovězí%'and "itemName" ilike '%Zadní%'; 


insert into itesco_vazebni
select distinct 117108 as csu_id, cast("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER -- cibule suchá
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%cibule%'and "breadCrumbs" ilike '%zelenina%';

insert into itesco_vazebni
select distinct 211101 as csu_id, cast ("ID" as int) itesco_id, 1 as UNIT_PRICE_MULTIPLIER -- tuzemák
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%Tuzemský%' or"itemName" ilike '%Tuzemák%' and "breadCrumbs" ilike '%Rumy%';

insert into itesco_vazebni
select distinct 213201 as csu_id, cast ("ID" as int) itesco_id,0.5 as UNIT_PRICE_MULTIPLIER-- pivo, světlé, lahvové
from v_itesco_stale_produkty_with_name
where "itemName" ilike '%pivo%' and "itemName" ilike '%světlý%' and "itemName" ilike '%ležák%' and "itemName" not like '% x%';

-- select count(*), csu_id
-- from itesco_vazebni
-- group by csu_id



-- select*
-- from v_itesco_stale_produkty_with_name
-- where "itemName" ilike '%pivo%' and "itemName" ilike '%světlý%' and "itemName" ilike '%ležák%' and "itemName" not like '% x%';
