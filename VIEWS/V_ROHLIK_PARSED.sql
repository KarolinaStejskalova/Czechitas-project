create or replace view V_ROHLIK_PARSED(
    ROHLIK_ID,
    "itemName",
    YEAR,
    MONTH,
    PRICE
) as
select 
    cast("itemId" as int) as rohlik_id,
    "itemName",
    year(to_date("date")) as year,
    month(to_date("date")) as month,
    cast("currentUnitPrice" as float) as price
from "rohlik_raw" where year not in(2019);