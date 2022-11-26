create or replace view V_KOSIK_STALE_ZBOZI_S_CENOVM_MULTIPLIKATOREM(
    KOSIK_ID,
    "itemName",
    UNITPRICEMULTIPLIER,
    "slug",
    "breadCrumbs",
    "quantity",
    RN
) as
-- unitPrice available from 2022-10-24 08:42:07
with kosik_with_unit_price_cte as (
SELECT 
    "itemId" as kosik_id,
--	"itemUrl",
    "itemName",
--	"discounted",
--	"discountedName",
--	"currentPrice",
--	"currentUnitPrice",
    "currentUnitPrice"/"currentPrice" as unitPriceMultiplier,
--	"originalPrice",
--	"inStock",
--	"category",
--	"img",
--	"shop",
    "slug",
--	"shopOrigin",
    "breadCrumbs",
--	"date",
--	"actRunId",
--	"_timestamp",
--	"useUnitPrice",
    "quantity",
    ROW_NUMBER() over (partition by kosik_id order by "date" desc, "quantity" desc) as RN -- Beru nejaktualnejsi zaznam s nejvyssim quantity
FROM
    "kosik_raw"
where "currentUnitPrice" <> '' and "breadCrumbs" <> ''
)
select 
    c.*
--	count(1) -- 8545 polozek
from kosik_with_unit_price_cte c
join V_KOSIK_STALE_PRODUKTY sp
on c.kosik_id = sp.ID
and c.RN = 1;