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
    ) as with kosik_cte as (
        select kv.CSU_ID,
            k."itemId" as kosik_id,
            YEAR(to_date("date")) as year,
            MONTH(to_date("date")) as month,
            "currentPrice" as kosik_price
        from "kosik_raw" k
            join KOSIK_VAZEBNI kv on kv.KOSIK_ID = k."itemId"
    ),
    kosik_agg_cte as (
        select c.CSU_ID,
            c.year,
            c.month,
            count(1) as scrape_num,
            avg(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_avg_price,
            min(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_min_price,
            max(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_max_price,
            variance(c.kosik_price * ksz.UNITPRICEMULTIPLIER) as kosik_var_price
        from kosik_cte c
            join V_KOSIK_STALE_ZBOZI_S_CENOVM_MULTIPLIKATOREM ksz on c.kosik_id = ksz.KOSIK_ID
        group by c.CSU_ID,
            c.year,
            c.month
    )
select csu.YEAR * 100 + csu.MONTH as datetime_key,
    csu.PRICE - c.kosik_avg_price as price_diff,
    c.*,
    csu.PRICE as csu_avg_price,
    csu.ITEM_NAME
from kosik_agg_cte c
    join V_CSU_PARSED csu on c.CSU_ID = csu.ID_ITEM
    and c.year = csu."YEAR"
    and c.month = csu."MONTH" --order by datetime_key, c.CSU_ID
;