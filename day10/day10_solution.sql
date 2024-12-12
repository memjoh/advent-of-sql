select
	date
from drinks
group by date
having sum(case when drink_name = 'Eggnog' then quantity end) = 198
	and sum(case when drink_name = 'Hot Cocoa' then quantity end) = 38
	and sum(case when drink_name = 'Peppermint Schnapps' then quantity end) = 298;
