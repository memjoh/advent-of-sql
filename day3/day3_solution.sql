select 
	food_item_id, count(*)
from (
	select 
		id, 
		unnest(xpath('//food_item_id/text()', menu_data::xml))::text::int AS food_item_id,
		COALESCE(
			NULLIF((xpath('string(//total_count)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//total_present)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//headcount)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//total_guests)', menu_data::xml)::text[])[1], '')::int
		) as guest_count
	from christmas_menus
)
where guest_count > 78 
group by 1
order by 2 desc;
