WITH RECURSIVE numbers(n) AS (
    SELECT 1                       -- base case
    UNION ALL
    SELECT n + 1 FROM numbers
    WHERE n < 10                    -- termination
)
SELECT n FROM numbers;
