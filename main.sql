

with recursive numbers(n) as (

    select 1 union ALL
    select n +1 FROM numbers where n < 10
)

select n from numbers;