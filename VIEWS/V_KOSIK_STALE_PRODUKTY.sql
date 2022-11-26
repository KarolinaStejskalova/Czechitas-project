create or replace view V_KOSIK_STALE_PRODUKTY(
    ID,
    "itemName",
    "itemUrl",
    "breadCrumbs",
    RN
) as
-- Vybirat produkty jen z tehle mnoziny - vyskutuje se ve vsech letech
with kosik_2020 as (
    select
        distinct cast("itemId" as int) as id
    from "kosik_raw"
    where year(to_date("date")) = 2020
),kosik_2021 as (
    select
        distinct cast("itemId" as int) as id
    from "kosik_raw"
    where year(to_date("date")) = 2021
),kosik_2022 as (
    select
        distinct cast("itemId" as int) as id
    from "kosik_raw"
    where year(to_date("date")) = 2022
),latest_item_cte as (
    select 
        cast("itemId" as int) as id,
        "itemName",
        "itemUrl",
        "breadCrumbs",
        row_number() over (partition by "itemId" order by "date" desc) as RN
    from "kosik_raw"
    where "currentUnitPrice" <> '' // Tady zkusit filtrovat na kategorii, vylezou adepti k vyberu
    -- and "breadCrumbs" = 'Trvanlivé > Konzervované potraviny > Ryby'
)

select
    -- count(distinct kosik_2020.id) cnt
    latest_item_cte.*
from kosik_2020
inner join kosik_2021
on kosik_2020.id = kosik_2021.id
inner join kosik_2022
on kosik_2020.id = kosik_2022.id
inner join latest_item_cte
on kosik_2020.id = latest_item_cte.id and latest_item_cte.RN = 1;