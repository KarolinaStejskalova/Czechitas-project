create or replace table itesco_vazebni(csu_id int, kosik_id int)

insert into itesco_vazebni
select distinct 114202 as csu_id, cast("ID" as int) itesco_id --mléko
from v_itesco_stale_produkty
where "itemName" ilike '%mléko%' and "itemName" ilike '%polotučné%' and "itemName" not like '%Sušené%' 
limit 100


insert into itesco_vazebni
select distinct 112707 as csu_id, cast("ID" as int) itesco_id --vepřová šunka
from v_itesco_stale_produkty
where "itemName" ilike '%šunka%' and "itemName" ilike '%vepřová%' 
limit 100


insert into itesco_vazebni
select distinct 114701 as csu_id, cast("ID" as int) itesco_id --slepičí vejce 10ks 
from v_itesco_stale_produkty
where "itemName" ilike '%vejce%' and "breadCrumbs"  ilike '%vejce%'and "itemName" not like '%30%' 
and "itemName" not like '%36%' and "itemName" not like '%6%' and "itemName" not like '%18%' and "itemName" not like '%15%'
and "itemName" not like '%Křepelčí%'
limit 100


insert into itesco_vazebni
select distinct 111201 as csu_id, cast("ID" as int) itesco_id --hladká mouka pšeničná
from v_itesco_stale_produkty
where "itemName" ilike '%mouka%' and "itemName" ilike '%hladká%' and "itemName" ilike '%pšeničná%'
limit 100


insert into itesco_vazebni
select distinct 115101  as csu_id, cast("ID" as int) itesco_id --máslo
from v_itesco_stale_produkty
where "itemName" ilike '%máslo%' and "itemName" not like '%lanýž%' and "itemName" not like '%kozí%' 
and "itemName" not like '%bylinné' 
and "itemName" not like '%Bylinkové%' and "itemName" not like '%Přepuštěné%' and "breadCrumbs" ilike '%máslo%'
and "itemName" not like '%Hera%' and"itemName" not like '%Rama%' and"itemName" not like '%Perla%'
and "itemName" not like '%Zlatá%'and "itemName" not like '%Omega%'
and "itemName" not like '%Roztíratelné%'and "itemName" not like '%Kozí%'and "itemName" not like '%přepuštěné%'
and "itemName" not like '%Kokosové%'
limit 100


insert into itesco_vazebni
select distinct 117401 as csu_id, cast("ID" as int) itesco_id  --brambory konzumní
from v_itesco_stale_produkty
where "itemName" ilike '%brambory%' and "itemName" ilike '%konzumní%' and "itemName" not like '%krájené%'and "itemName" not like '%loupané%'
limit 100


insert into itesco_vazebni
select distinct 118101 as csu_id, cast("ID" as int) itesco_id --cukr krystal
from v_itesco_stale_produkty
where "itemName" ilike '%Cukr%' and "itemName" ilike '%Krystal%' 
or "itemName" ilike '%krystalový%' and "breadCrumbs" ilike '%Trvanlivé%'


insert into itesco_vazebni
select distinct 112101 as csu_id, cast("ID" as int) itesco_id --hovězí zadní bez kosti
from v_itesco_stale_produkty
where "itemName" ilike '%Hovězí%'and "itemName" ilike '%Zadní%' 
limit 100


insert into itesco_vazebni
select distinct 117108 as csu_id, cast("ID" as int) itesco_id -- cibule suchá
from v_itesco_stale_produkty
where "itemName" ilike '%cibule%'and "breadCrumbs" ilike '%zelenina%'
limit 100

insert into itesco_vazebni
select distinct 211101 as csu_id, cast ("ID" as int) itesco_id -- tuzemák
from v_itesco_stale_produkty
where "itemName" ilike '%Tuzemský%' or"itemName" ilike '%Tuzemák%' and "breadCrumbs" ilike '%Rumy%'
limit 100

insert into itesco_vazebni
select distinct 213201 as csu_id, cast ("ID" as int) itesco_id -- pivo, světlé, lahvové
from v_itesco_stale_produkty
where "itemName" ilike '%pivo%' and "itemName" ilike '%světlý%' and "itemName" ilike '%ležák%' 
limit 100

select count(*), csu_id
from itesco_vazebni
group by csu_id