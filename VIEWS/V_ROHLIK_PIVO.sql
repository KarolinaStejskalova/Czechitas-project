create or replace view V_ROHLIK_PIVO(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from v_rohlik_stale_produkty
where "itemName" ilike '%ležák%' and "itemName" ilike '%světlý%' and "itemName" ilike '%sklo%';