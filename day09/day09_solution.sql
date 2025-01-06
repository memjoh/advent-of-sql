with avg_speeds as (
	select
		r.reindeer_name,
		t.exercise_name,
		round(avg(speed_record),2) avg_speed_record
	from training_sessions t
	join reindeers r on t.reindeer_id = r.reindeer_id
	where reindeer_name <> 'Rudolf'
	group by r.reindeer_name, exercise_name
)

select * 
from (
  select 
  	*, 
  	rank() over(partition by reindeer_name order by avg_speed_record desc) as rank_speeds
  from avg_speeds
)
where rank_speeds=1
order by avg_speed_record desc
limit 3;
