create or replace view V_ITESCO_STALE_PRODUKTY(
    ID,
    "breadCrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
with itesco_2020 as (
    select
        distinct "itemId" as id
    from "itesco_raw"
    where year(to_date("date")) = 2020
    and "itemId"<> '' and "date" <> ''
    --limit 10
),itesco_2021 as (
    select
        distinct "itemId" as id
    from "itesco_raw"
    where year(to_date("date")) = 2021
     and "itemId"<> '' and "date" <> ''
),itesco_2022 as (
    select
        distinct "itemId" as id,
        "breadCrumbs",
        "itemId",
        "itemUrl",
        "itemName"
    from "itesco_raw"
    where year(to_date("date")) = 2022
     and "itemId"<> '' and "date" <> ''
)

select  itesco_2022.*
from itesco_2020
inner join itesco_2021
on itesco_2020.id = itesco_2021.id
inner join itesco_2022
on itesco_2020.id = itesco_2022.id;