create or replace view V_ROHLIK_STALE_PRODUKTY(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
-- Vybirat produkty jen z tehle mnoziny - vyskutuje se ve vsech letech
with rohlik_2020 as (
    select
        distinct cast("itemId" as int) as id
    from "rohlik_raw"
    where year(to_date("date")) = 2020
),rohlik_2021 as (
    select
        distinct cast("itemId" as int) as id
    from "rohlik_raw"
    where year(to_date("date")) = 2021
),rohlik_2022 as (
    select
        distinct cast("itemId" as int) as id,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
    from "rohlik_raw"
    where year(to_date("date")) = 2022
    

)

select
    -- count(distinct kosik_2020.id) cnt
    rohlik_2022.*
from rohlik_2020
inner join rohlik_2021
on rohlik_2020.id = rohlik_2021.id
inner join rohlik_2022
on rohlik_2020.id = rohlik_2022.id;