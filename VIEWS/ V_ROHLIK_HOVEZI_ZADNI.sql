create or replace view V_ROHLIK_HOVEZI_ZADNI(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select
*
from v_rohlik_stale_produkty
where "itemName" ilike '%Hovězí%'and "itemName" ilike '%Zadní%';