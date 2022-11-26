create or replace database KEBOOLA_9658;

create or replace transient schema WORKSPACE_25786081;

create or replace TRANSIENT TABLE CSU_DATA (
    ITEM_NAME VARCHAR(16777216),
    ID_ITEM VARCHAR(16777216),
    PRICE VARCHAR(16777216),
    YEAR VARCHAR(16777216),
    MONTH VARCHAR(16777216),
    UNIT VARCHAR(100)
);
create or replace TRANSIENT TABLE CSU_RAW (
    ITEM VARCHAR(16777216),
    ID_ITEM VARCHAR(16777216),
    PRICE VARCHAR(16777216),
    YEAR VARCHAR(16777216),
    MONTH VARCHAR(16777216),
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace TRANSIENT TABLE ITESCO_VAZEBNI (
    CSU_ID NUMBER(38,0),
    ITESCO_ID NUMBER(38,0),
    UNIT_PRICE_MULTIPLIER FLOAT
);
create or replace TRANSIENT TABLE KOSIK_VAZEBNI (
    CSU_ID NUMBER(38,0),
    KOSIK_ID NUMBER(38,0),
    UNIT_PRICE_MULTIPLIER FLOAT
);
create or replace TRANSIENT TABLE ROHLIK_VAZEBNI (
    CSU_ID NUMBER(38,0),
    ROHLIK_ID NUMBER(38,0),
    UNIT_PRICE_MULTIPLIER FLOAT
);
create or replace TRANSIENT TABLE ROHLIK_VAZEBNI1 (
    CSU_ID NUMBER(38,0),
    ROHLIK_ID NUMBER(38,0),
    UNIT_PRICE_MULTIPLIER NUMBER(38,0)
);
create or replace TRANSIENT TABLE "csu-2020-xlsx-data-csu-2020-xlsx-data" (
    ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    ID_ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    PRICE VARCHAR(16777216) NOT NULL DEFAULT '',
    YEAR VARCHAR(16777216) NOT NULL DEFAULT '',
    MONTH VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace TRANSIENT TABLE "csu-2021-xlsx-data-csu-2021-xlsx-data" (
    ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    ID_ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    PRICE VARCHAR(16777216) NOT NULL DEFAULT '',
    YEAR VARCHAR(16777216) NOT NULL DEFAULT '',
    MONTH VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace TRANSIENT TABLE "csu-2022-xlsx-data-csu-2022-xlsx-data" (
    ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    ID_ITEM VARCHAR(16777216) NOT NULL DEFAULT '',
    PRICE VARCHAR(16777216) NOT NULL DEFAULT '',
    YEAR VARCHAR(16777216) NOT NULL DEFAULT '',
    MONTH VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace TRANSIENT TABLE "itesco_raw" (
    "currency" VARCHAR(16777216) NOT NULL DEFAULT '',
    "category" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemUrl" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemName" VARCHAR(16777216) NOT NULL DEFAULT '',
    "discounted" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currentPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "originalPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currentUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "useUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "originalUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "img" VARCHAR(16777216) NOT NULL DEFAULT '',
    "inStock" VARCHAR(16777216) NOT NULL DEFAULT '',
    "breadCrumbs" VARCHAR(16777216) NOT NULL DEFAULT '',
    "unitOfMeasure" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shop" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shopOrigin" VARCHAR(16777216) NOT NULL DEFAULT '',
    "slug" VARCHAR(16777216) NOT NULL DEFAULT '',
    "date" VARCHAR(16777216) NOT NULL DEFAULT '',
    "actRunId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace TRANSIENT TABLE "kosik_raw" (
    "itemId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemUrl" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemName" VARCHAR(16777216) NOT NULL DEFAULT '',
    "discounted" VARCHAR(16777216) NOT NULL DEFAULT '',
    "discountedName" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currentPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "originalPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "inStock" VARCHAR(16777216) NOT NULL DEFAULT '',
    "category" VARCHAR(16777216) NOT NULL DEFAULT '',
    "img" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shop" VARCHAR(16777216) NOT NULL DEFAULT '',
    "slug" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shopOrigin" VARCHAR(16777216) NOT NULL DEFAULT '',
    "breadCrumbs" VARCHAR(16777216) NOT NULL DEFAULT '',
    "date" VARCHAR(16777216) NOT NULL DEFAULT '',
    "actRunId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9),
    "currentUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "useUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "quantity" VARCHAR(16777216) NOT NULL DEFAULT ''
);
create or replace TRANSIENT TABLE "rohlik_raw" (
    "img" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemUrl" VARCHAR(16777216) NOT NULL DEFAULT '',
    "itemName" VARCHAR(16777216) NOT NULL DEFAULT '',
    "discounted" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currentPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currentUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "currency" VARCHAR(16777216) NOT NULL DEFAULT '',
    "inStock" VARCHAR(16777216) NOT NULL DEFAULT '',
    "useUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "originalPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "originalUnitPrice" VARCHAR(16777216) NOT NULL DEFAULT '',
    "breadcrumbs" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shop" VARCHAR(16777216) NOT NULL DEFAULT '',
    "shopOrigin" VARCHAR(16777216) NOT NULL DEFAULT '',
    "slug" VARCHAR(16777216) NOT NULL DEFAULT '',
    "category" VARCHAR(16777216) NOT NULL DEFAULT '',
    "date" VARCHAR(16777216) NOT NULL DEFAULT '',
    "actRunId" VARCHAR(16777216) NOT NULL DEFAULT '',
    "_timestamp" TIMESTAMP_NTZ(9)
);
create or replace view V_CSU_ALL_COMPARISON(
    CSU_ID,
    ITEM_NAME,
    YEAR,
    MONTH,
    CSU_AVG_PRICE,
    ROHLIK_AVG_PRICE,
    KOSIK_AVG_PRICE,
    ITESCO_AVG_PRICE,
    ROHLIK_DIFF_FROM_CSU,
    KOSIK_DIFF_FROM_CSU,
    ITESCO_DIFF_FROM_CSU,
    ROHLIK_MIN_PRICE,
    KOSIK_MIN_PRICE,
    ITESCO_MIN_PRICE,
    ROHLIK_MAX_PRICE,
    KOSIK_MAX_PRICE,
    ITESCO_MAX_PRICE,
    ROHLIK_VAR_PRICE,
    KOSIK_VAR_PRICE,
    ITESCO_VAR_PRICE
) as 
SELECT
        csu.ID_ITEM as CSU_ID,
        csu.ITEM_NAME,
        csu."YEAR",
        csu."MONTH",
        csu.PRICE as CSU_AVG_PRICE,
        rc.PRICE_AVG_ROHL as ROHLIK_AVG_PRICE,
        kc.KOSIK_AVG_PRICE,
        tc.ITESCO_AVG_PRICE,
        rc.PRICE_DIFF as ROHLIK_DIFF_FROM_CSU,
        kc.PRICE_DIFF as KOSIK_DIFF_FROM_CSU,
        csu.PRICE - tc.ITESCO_AVG_PRICE as ITESCO_DIFF_FROM_CSU,
        rc.PRICE_MIN_ROHL as ROHLIK_MIN_PRICE,
        kc.KOSIK_MIN_PRICE,
        tc.ITESCO_MIN_PRICE,
        rc.PRICE_MAX_ROHL as ROHLIK_MAX_PRICE,
        kc.KOSIK_MAX_PRICE,
        tc.ITESCO_MAX_PRICE,
        rc.PRICE_VARIANCE_ROHL as ROHLIK_VAR_PRICE,
        kc.KOSIK_VAR_PRICE,
        tc.ITESCO_VAR_PRICE 
--	count(1)
FROM
    V_CSU_PARSED csu
JOIN V_CSU_ROHLIK_PRICE_COMPARISON_FIXED rc
ON
    csu.ID_ITEM = rc.ID_ITEM
    AND csu."YEAR" = rc."YEAR"
    AND csu."MONTH" = rc."MONTH"
JOIN V_CSU_KOSIK_PRICE_COMPARISON kc
ON
    csu.ID_ITEM = kc.CSU_ID
    AND csu."YEAR" = kc."YEAR"
    AND csu."MONTH" = kc."MONTH"
JOIN V_CSU_ITESCO_PRICE_COMPARISON tc
ON
    csu.ID_ITEM = tc.CSU_ID
    AND csu."YEAR" = tc."YEAR"
    AND csu."MONTH" = tc."MONTH"
order by CSU_ID, YEAR, MONTH;
create or replace view V_CSU_ITESCO_PRICE_COMPARISON(
    CSU_ID,
    YEAR,
    MONTH,
    SCRAPE_NUM,
    ITESCO_AVG_PRICE,
    ITESCO_MIN_PRICE,
    ITESCO_MAX_PRICE,
    ITESCO_VAR_PRICE,
    CSU_AVG_PRICE,
    ITEM_NAME
) as
WITH itesco_parsed_cte AS (
    SELECT 
        TRY_TO_NUMBER("itemId") id,
        "currentPrice",
        YEAR(to_date(tr."date")) AS YEAR,
        MONTH(to_date(tr."date")) AS MONTH
    FROM
        "itesco_raw" tr
    WHERE
        tr."itemId" <> ''
),
itesco_agg_cte AS (
    SELECT
        tv.CSU_ID,
        t.year,
        t.month,
        count(1) as scrape_num,
        avg(TRY_TO_NUMBER(t."currentPrice",10,2) * tsp.MUTLIPLICATOR * tv.UNIT_PRICE_MULTIPLIER) as itesco_avg_price,
        min(TRY_TO_NUMBER(t."currentPrice",10,2) * tsp.MUTLIPLICATOR * tv.UNIT_PRICE_MULTIPLIER) as itesco_min_price,
        max(TRY_TO_NUMBER(t."currentPrice",10,2) * tsp.MUTLIPLICATOR * tv.UNIT_PRICE_MULTIPLIER) as itesco_max_price,
        variance(TRY_TO_NUMBER(t."currentPrice",10,2) * tsp.MUTLIPLICATOR * tv.UNIT_PRICE_MULTIPLIER) as itesco_var_price
    FROM
        itesco_parsed_cte T
    JOIN ITESCO_VAZEBNI tv
    ON
        t.id = tv.ITESCO_ID
    join V_ITESCO_STALE_PRODUKTY tsp
    on TRY_TO_NUMBER(tsp.ID) = T.id
    group by tv.CSU_ID, T.year, T.month
)
SELECT
    c.*, csu.PRICE as CSU_AVG_PRICE, csu.ITEM_NAME 
FROM
    itesco_agg_cte c
join V_CSU_PARSED csu
on c.CSU_ID = csu.ID_ITEM 
and c.YEAR = csu."YEAR"
and c.MONTH = csu."MONTH" 
order by c.CSU_ID, c.YEAR, c.MONTH;
create or replace view V_CSU_KOSIK_PRICE_COMPARISON(
    DATETIME_KEY,
    PRICE_DIFF,
    CSU_ID,
    YEAR,
    MONTH,
    SCRAPE_NUM,
    KOSIK_AVG_PRICE,
    KOSIK_MIN_PRICE,
    KOSIK_MAX_PRICE,
    KOSIK_VAR_PRICE,
    CSU_AVG_PRICE,
    ITEM_NAME
) as
with kosik_cte as (
    select
        kv.CSU_ID,
        k."itemId" as kosik_id,
        YEAR(to_date("date")) as year,
        MONTH(to_date("date")) as month,
        "currentPrice"*kv.unit_price_multiplier as kosik_price
    from "kosik_raw" k
    join KOSIK_VAZEBNI kv
    on kv.KOSIK_ID = k."itemId"
),kosik_agg_cte as (
    select 
    c.CSU_ID,
    c.year,
    c.month,
    count(1) as scrape_num,
    avg(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_avg_price,
    min(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_min_price,
    max(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_max_price,
    variance(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_var_price
    from kosik_cte c
    join V_KOSIK_STALE_ZBOZI_S_CENOVM_MULTIPLIKATOREM ksz
    on c.kosik_id = ksz.KOSIK_ID 
    group by c.CSU_ID, c.year, c.month
)
select
    csu.YEAR * 100 + csu.MONTH as datetime_key,
    csu.PRICE - c.kosik_avg_price as price_diff,
    c.*,
    csu.PRICE as csu_avg_price,
    csu.ITEM_NAME
from kosik_agg_cte c
join V_CSU_PARSED csu
on c.CSU_ID = csu.ID_ITEM 
    and c.year = csu."YEAR"
    and c.month = csu."MONTH"
--order by datetime_key, c.CSU_ID
;
create or replace view V_CSU_PARSED(
    ID_ITEM,
    ITEM_NAME,
    UNIT,
    YEAR,
    MONTH,
    MONTH_LABEL,
    PRICE
) as
select
    cast(id_item as int) id_item,
    item_name,
    unit,
    cast(year as int) year,
    case month
        when 'Leden' then 1
        when 'Únor' then 2
        when 'Březen' then 3
        when 'Duben' then 4
        when 'Květen' then 5
        when 'Červen' then 6       
        when 'Červenec' then 7
        when 'Srpen' then 8
        when 'Září' then 9
        when 'Říjen' then 10
        when 'Listopad' then 11
        when 'Prosinec' then 12
    end as month,
    month as month_label,
    cast(price as float) as price  
from csu_data
order by year, month;
create or replace view V_CSU_ROHLIK_PRICE_COMPARISON(
    DATETIME_KEY,
    PRICE_DIFF,
    ID_ITEM,
    ITEM_NAME,
    UNIT,
    YEAR,
    MONTH,
    MONTH_LABEL,
    PRICE_CSU,
    SCRAPE_NUM,
    PRICE_AVG_ROHL,
    PRICE_MIN_ROHL,
    PRICE_MAX_ROHL,
    PRICE_VARIANCE_ROHL
) as
select
    csu.YEAR * 100 + csu.MONTH as datetime_key,
    csu.price - agg.price_avg as price_diff,
    csu.ID_ITEM, csu.ITEM_NAME, csu.UNIT, csu.YEAR, csu.MONTH, csu.MONTH_LABEL, csu.PRICE as price_csu,
    SCRAPE_NUM, PRICE_AVG as price_avg_rohl, PRICE_MIN as price_min_rohl, PRICE_MAX as price_max_rohl, PRICE_VARIANCE as price_variance_rohl
from v_csu_parsed csu
join v_rohlik_aggregation_year_month agg 
on agg.CSU_ID = csu.id_item
    and agg.YEAR = csu.YEAR
    and agg.MONTH = csu.MONTH;
create or replace view V_CSU_ROHLIK_PRICE_COMPARISON_FIXED(
    DATETIME_KEY,
    PRICE_DIFF,
    ID_ITEM,
    ITEM_NAME,
    UNIT,
    YEAR,
    MONTH,
    MONTH_LABEL,
    PRICE_CSU,
    SCRAPE_NUM,
    PRICE_AVG_ROHL,
    PRICE_MIN_ROHL,
    PRICE_MAX_ROHL,
    PRICE_VARIANCE_ROHL
) as
select
    csu.YEAR * 100 + csu.MONTH as datetime_key,
    csu.price - agg.price_avg as price_diff,
    csu.ID_ITEM, csu.ITEM_NAME, csu.UNIT, csu.YEAR, csu.MONTH, csu.MONTH_LABEL, csu.PRICE as price_csu,
    SCRAPE_NUM, PRICE_AVG as price_avg_rohl, PRICE_MIN as price_min_rohl, PRICE_MAX as price_max_rohl, PRICE_VARIANCE as price_variance_rohl
from v_csu_parsed csu
join v_rohlik_aggregation_year_month_by_csu_id agg 
on agg.CSU_ID = csu.id_item
    and agg.YEAR = csu.YEAR
    and agg.MONTH = csu.MONTH;
create or replace view V_ITESCO_STALE_PRODUKTY(
    ID,
    PARSED_WEIGHT_NUM,
    MUTLIPLICATOR
) as
with itesco_2020 as (
    select
        distinct "itemId" as id
    from "itesco_raw"
    where year(to_date("date")) = 2020
    and "itemId"<> '' and "date" <> ''
),itesco_2021 as (
    select
        distinct "itemId" as id
    from "itesco_raw"
    where year(to_date("date")) = 2021
     and "itemId"<> '' and "date" <> ''
),itesco_2022_fix as (
    select
        distinct "itemId", REPLACE("itemName", ' ks', 'ks') as ITEM_NAME
    from "itesco_raw"
    where year(to_date("date")) = 2022
     and "itemId"<> '' and "date" <> ''
),itesco_2022 as (
    select
        distinct "itemId" as id
    ,split(ITEM_NAME,' ')[array_size(split(ITEM_NAME,' '))-1] as parsed_weight
    from itesco_2022_fix
)
,result_cte as (
    select  
        itesco_2022.*,
        cast(regexp_substr(replace(parsed_weight,',','.'),'[+-]?([0-9]*[.])?[0-9]+') as float) as parsed_weight_num
    from itesco_2020
    inner join itesco_2021
    on itesco_2020.id = itesco_2021.id
    inner join itesco_2022
    on itesco_2020.id = itesco_2022.id
)
select ID,PARSED_WEIGHT_NUM,
    case 
        when parsed_weight_num is NULL then NULL
        when parsed_weight_num = 0 then NULL
        when parsed_weight ilike '%kg' then 1 / parsed_weight_num
        when parsed_weight not ilike '%ml' and parsed_weight ilike '%l' then 1 / parsed_weight_num
        when parsed_weight ilike '%ks' then 1 / parsed_weight_num
        else 1000 / parsed_weight_num
    end as mutliplicator
from result_cte;
create or replace view V_ITESCO_STALE_PRODUKTY_WITH_NAME(
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
create or replace view V_ROHLIK_AGGREGATION_YEAR_MONTH(
    ROHLIK_ID,
    "itemName",
    CSU_ID,
    YEAR,
    MONTH,
    SCRAPE_NUM,
    PRICE_AVG,
    PRICE_MIN,
    PRICE_MAX,
    PRICE_VARIANCE
) as
select
    rohlik_id,
    "itemName",
    csu_id, YEAR, MONTH,
    count(1) as scrape_num,
    avg(price_unit) as price_avg,
    min(price_unit) as price_min,
    max(price_unit) as price_max,
    variance(price_unit) as price_variance
from v_rohlik_vazebni_vyber
group by csu_id, YEAR, MONTH, rohlik_id,"itemName";
create or replace view V_ROHLIK_AGGREGATION_YEAR_MONTH_BY_CSU_ID(
    CSU_ID,
    YEAR,
    MONTH,
    SCRAPE_NUM,
    PRICE_AVG,
    PRICE_MIN,
    PRICE_MAX,
    PRICE_VARIANCE
) as
with rohlik_filtered as (
    select
        vr.csu_id,
        r.ROHLIK_ID, 
        r."itemName", 
        r."YEAR", 
        r."MONTH", 
        r.PRICE * vr.UNIT_PRICE_MULTIPLIER as PRICE // Napr. vejce ma CSU po 10ks, rohlik po 1ks 	
    from v_rohlik_parsed r 
    join rohlik_vazebni vr // Filtrovano podle vazebni tabulky pro dalsi agregaci
    on r.rohlik_id = vr.rohlik_id
)

// Agregace polozky pres casovou dimenzi - rok a mesic + bezne stat. metriky
select
    csu_id, YEAR, MONTH,
    count(1) as scrape_num,
    avg(PRICE) as price_avg,
    min(PRICE) as price_min,
    max(PRICE) as price_max,
    variance(PRICE) as price_variance
from rohlik_filtered
group by csu_id, YEAR, MONTH;
create or replace view V_ROHLIK_BRAMBORY(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from v_rohlik_stale_produkty
where "itemName" ilike '%brambory%' 
and "itemName" ilike '%konzumní%' 
and "itemName" not like '%krájené%'
and "itemName" not like '%loupané%' 
and "itemName" not like '%Grenaille';
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
create or replace view V_ROHLIK_CUKR_KRYSTAL(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select
*
from v_rohlik_stale_produkty
where "itemName" ilike '%Cukr%' and "itemName" ilike '%Krystal%' 
or "itemName" ilike '%krystalový%' and "breadcrumbs" ilike '%Trvanlivé%';
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
    and "breadcrumbs"not like '%Pomazánkové';
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
    or "breadcrumbs" ilike '%Mléčné a chlazené,Mléko a mléčné nápoje,Trvanlivé'
    )
    and "itemName" not like '%koz%'
    and "itemName" not like '%Koz%'
    and "itemName"not like '%smetana%';
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
create or replace view V_ROHLIK_PIVO(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from v_rohlik_stale_produkty
where "itemName" ilike '%ležák%' and "itemName" ilike '%světlý%' and "itemName" ilike '%sklo%' and "itemName" not like '%8x%';
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
create or replace view V_ROHLIK_SUNKA(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as
select *
from V_ROHLIK_STALE_PRODUKTY
where "itemName" ilike '%šunka%' and "itemName" ilike '%vepřová%';
create or replace view V_ROHLIK_TUZEMAK(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as select 
*
from v_rohlik_stale_produkty
where "itemName" ilike '%Tuzemský%' or"itemName" ilike '%Tuzemák%' and "breadcrumbs" ilike '%Rumy%';
create or replace view V_ROHLIK_VAZEBNI_VYBER(
    CSU_ID,
    ROHLIK_ID,
    "itemName",
    PRICE_UNIT,
    CURRENTPRICE,
    YEAR,
    MONTH
) as
select r.csu_id, 
r.rohlik_id, 
rr."itemName", 
cast(rr."currentUnitPrice" as float) as price_unit,
cast (rr."currentPrice" as float) as currentPrice,
year(to_date("date")) as year, 
month(to_date("date")) as month
from rohlik_vazebni as r
join "rohlik_raw" as rr
on r.rohlik_id = rr."itemId"
where year not in (2019);
create or replace view V_ROHLIK_VEJCE(
    ID,
    "breadcrumbs",
    "itemId",
    "itemUrl",
    "itemName"
) as 
select *
from v_rohlik_stale_produkty
where "itemName" ilike '%vejce%' and "breadcrumbs"  ilike '%vejce%'and "itemName" not like '%30%' 
and "itemName" not like '%36%' and "itemName" not like '%6%' and "itemName" not like '%18%' and "itemName" not like '%15%'
and "itemName" not like '%Křepelčí%';