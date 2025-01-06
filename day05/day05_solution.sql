WITH base AS (
	SELECT
		production_date,
		CAST(toys_produced AS numeric) toys_produced,
		CAST(LAG(toys_produced) OVER (ORDER BY production_date) AS numeric) AS previous_day_toys_produced
	FROM toy_production
)

SELECT 
	*,
	toys_produced - previous_day_toys_produced AS previous_day_diff,
	ROUND(100 * (toys_produced - previous_day_toys_produced)/previous_day_toys_produced,3) AS previous_day_perc_change
FROM base
ORDER BY 5 DESC;
