select 
	gift_name,
	count(*) as countall,
	percent_rank() over(order by count(*)) as percent_rank
from gift_requests a
join gifts b on a.gift_id=b.gift_id
group by gift_name
order by percent_rank desc, gift_name;
