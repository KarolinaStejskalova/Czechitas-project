create or replace view 
(
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
        r.*
    from v_rohlik_parsed r 
    join vazebni_rohlik vr // Filtrovano podle vazebni tabulky pro dalsi agregaci
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