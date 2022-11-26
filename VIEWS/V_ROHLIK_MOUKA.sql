create or replace view V_ROHLIK_MOUKA(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select
*
from v_rohlik_stale_produkty
where "itemName" ilike '%mouka%' and "itemName" ilike '%hladká%' and "itemName" ilike '%pšeničná%';