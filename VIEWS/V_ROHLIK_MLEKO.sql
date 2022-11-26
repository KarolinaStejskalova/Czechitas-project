create or replace view V_ROHLIK_MLEKO(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as 
select *
from V_ROHLIK_STALE_PRODUKTY
where (
    "breadcrumbs" ilike '["Mléčné a chlazené"%' 
    or "breadcrumbs" ilike '%Mléčné a chlazené,Mléko a mléčné nápoje,Čerstvé' 
    --or "breadcrumbs" ilike 'Mléčné a chlazené,Mléko a mléčné nápoje,Mléčné a jogurtové nápoje'
    or "breadcrumbs" ilike '%Mléčné a chlazené,Mléko a mléčné nápoje,Trvanlivé'
    )
    and "itemName" not like '%koz%'
    and "itemName" not like '%Koz%'
    and "itemName"not like '%smetana%';