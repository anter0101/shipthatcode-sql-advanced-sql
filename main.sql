CREATE TABLE sales (
    day INTEGER,
    amount NUMERIC(10, 2)
);

INSERT INTO sales (day, amount)
VALUES
    (1, 100),
    (2, 150),
    (3, 200),
    (4, 175),
    (5, 220);

SELECT
    day || '|' || SUM(amount) OVER (ORDER BY day) AS result
FROM sales;