WITH base AS (  
	SELECT
		name,

    -- extract info from json elements and arrays
		wishes->>'first_choice' as primary_wish,
		wishes->>'second_choice' as backup_wish,
		wishes->'colors'->>0 as favorite_color,
	
		jsonb_array_length((wishes->'colors')::jsonb) as color_count
		
	FROM wish_lists w
	JOIN children c
		ON c.child_id = w.child_id
)

SELECT 
	b.*,

	case
		when t.difficulty_to_make >= 3 then 'Complex Gift'
		when t.difficulty_to_make = 2 then 'Moderate Gift'
		when t.difficulty_to_make = 1 then 'Simple Gift'
	end as gift_complexity,
	case
		when t.category = 'outdoor' then 'Outside Workshop'
		when t.category = 'educational' then 'Learning Workshop'
		else 'General Workshop'
	end as workshop_assignment
	
FROM base b
LEFT JOIN toy_catalogue t
	ON t.toy_name = b.primary_wish
ORDER BY name
LIMIT 5;
