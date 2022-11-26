create or replace view V_CSU_ROHLIK_PRICE_COMPARISON(
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
select csu.price - agg.price_avg as price_diff,
    csu.ID_ITEM,
    csu.ITEM_NAME,
    csu.UNIT,
    csu.YEAR,
    csu.MONTH,
    csu.MONTH_LABEL,
    csu.PRICE as price_csu,
    SCRAPE_NUM,
    PRICE_AVG as price_avg_rohl,
    PRICE_MIN as price_min_rohl,
    PRICE_MAX as price_max_rohl,
    PRICE_VARIANCE as price_variance_rohl
from v_csu_parsed csu
    join v_rohlik_aggregation_year_month agg on agg.CSU_ID = csu.id_item
    and agg.YEAR = csu.YEAR
    and agg.MONTH = csu.MONTH;