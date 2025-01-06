WITH child_gift_prices AS (
	SELECT 
		a.child_id,
		a.name,
		gift_id,
		price AS child_gift_price
	FROM children a
	JOIN gifts b
		ON a.child_id = b.child_id
)

, average AS (
	SELECT avg(price) AS average_gift_price
	FROM gifts
)

SELECT *
FROM child_gift_prices
JOIN average ON 1=1
WHERE child_gift_price > average_gift_price
ORDER BY child_gift_price asc;
