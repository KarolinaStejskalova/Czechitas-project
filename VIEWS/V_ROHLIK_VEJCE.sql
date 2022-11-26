create or replace view V_ROHLIK_VEJCE(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as select *
from v_rohlik_stale_produkty
where "itemName" ilike '%vejce%' and "breadcrumbs"  ilike '%vejce%'and "itemName" not like '%30%' 
and "itemName" not like '%36%' and "itemName" not like '%6%' and "itemName" not like '%18%' and "itemName" not like '%15%'
and "itemName" not like '%Křepelčí%';