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