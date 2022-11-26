create or replace view V_ROHLIK_CIBULE(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
SELECT
*
from V_ROHLIK_STALE_PRODUKTY
where "itemName" ilike '%cibule%'and "breadcrumbs" ilike '%zelenina%';