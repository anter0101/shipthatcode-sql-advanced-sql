CREATE TABLE sales (
    day DATE,
    amount NUMERIC(10, 2)
);

INSERT INTO sales (day, amount)
VALUES
    ('2026-01-01', 100),
    ('2026-01-02', 50),
    ('2026-01-03', 75),
    ('2026-01-04', 25),
    ('2026-01-05', 200);

SELECT
    EXTRACT(DAY FROM day)::int
    || '|' ||
    SUM(amount) OVER (ORDER BY day) AS result
FROM sales;