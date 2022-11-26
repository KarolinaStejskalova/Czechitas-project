create or replace view V_ROHLIK_MASLO(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as 
select*
from V_ROHLIK_STALE_PRODUKTY
where
    "itemName" ilike '%m%slo' 
    and ("breadcrumbs" ilike '%["Mléčné a chlazené","Máslo, tuky a margaríny","Máslo"]'
    or "breadcrumbs" ilike 'Mléčné a chlazené,Máslo%')
    and "itemName" not like '%Pomazánkové%' and "itemName"not like '%kozí%' and "itemName" not like '%Flora%'
    and "itemName" not like '%Ghíčko%' and "itemName" not like '%lanýže%'and "itemName" not like '%solen%' and "itemName" not like '%%Ghee%' and "itemName" not like '%solí%'
    and "breadcrumbs"not like '%Pomazánkové'
limit 100;