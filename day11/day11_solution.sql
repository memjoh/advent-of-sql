select *,
avg(trees_harvested) over 
	(partition by field_name order by harvest_year desc, season_rank desc
		rows between 0 preceding and 2 following) as three_season_avg
from (
	select 
		*,
		case 
			when season = 'Spring' then 1 
			when season = 'Summer' then 2
			when season = 'Fall' then 3
			when season = 'Winter' then 4
		end as season_rank
	from treeharvests
)
order by three_season_avg desc
limit 1;
