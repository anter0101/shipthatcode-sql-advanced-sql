
SELECT
    day || '|' || SUM(amount) OVER (ORDER BY day) AS result
FROM sales;