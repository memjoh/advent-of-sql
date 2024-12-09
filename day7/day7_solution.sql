WITH years_exp AS (
	SELECT
		primary_skill,
		MIN(years_experience) AS min_years_experience,
		MAX(years_experience) AS max_years_experience
	FROM workshop_elves
	GROUP BY primary_skill
)

SELECT * FROM (
SELECT 
	MIN(CASE
		WHEN mn.max_years_experience = we.years_experience 
			THEN we.elf_id
	END) AS elf_1_id,
	MIN(CASE
		WHEN mn.min_years_experience = we.years_experience 
			THEN we.elf_id
	END) AS elf_2_id,
	we.primary_skill
FROM workshop_elves we
JOIN years_exp mn
	ON we.primary_skill = mn.primary_skill
GROUP BY we.primary_skill
)
WHERE elf_1_id IS NOT NULL OR elf_2_id IS NOT NULL;
