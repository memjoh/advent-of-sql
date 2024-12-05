WITH base AS (
	SELECT 
		*,
		CASE
			WHEN NOT new_tags_unnested = ANY(previous_tags) 
			THEN new_tags_unnested 
		END AS added_tags,
		CASE
			WHEN previous_tags_unnested = ANY(new_tags) 
			THEN previous_tags_unnested 
		END AS unchanged_tags,
		CASE
			WHEN NOT previous_tags_unnested = ANY(new_tags) 
			THEN previous_tags_unnested 
		END AS removed_tags
		
		
	FROM (
		SELECT
			*,
			UNNEST(previous_tags) as previous_tags_unnested,
			UNNEST(new_tags) as new_tags_unnested
		FROM toy_production
	)
)

SELECT
	toy_id,
	toy_name,
	COUNT(added_tags) added_tags,
	COUNT(unchanged_tags) unchanged_tags,
	COUNT(removed_tags) removed_tags
FROM base
GROUP BY 1,2
ORDER BY 3 DESC;
