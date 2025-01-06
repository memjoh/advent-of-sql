SELECT 
  -- concatenate all rows into single cell
	STRING_AGG(value, '')
FROM 
(
	SELECT
    -- returns character from ASCII code value
		CHR(value) as value
	FROM letters_a
	
	UNION ALL
	
	SELECT
		CHR(value) as value
	FROM letters_b
)
-- remove unneeded special characters
WHERE REGEXP_REPLACE(value, '[^a-zA-Z\s,.!]+', '') <> ''
