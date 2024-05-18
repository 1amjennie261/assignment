WITH recursive date_cte AS (
    SELECT
        TIMESTAMP '2000-01-01 00:00:00' + INTERVAL '1 hour' AS date
    UNION ALL
    SELECT
        date + INTERVAL '1 hour'
    FROM date_series
    WHERE date + INTERVAL '1 hour' <= TIMESTAMP '2024-05-01 23:00:00'
)

SELECT
    EXTRACT(YEAR FROM date) * 1000000 + EXTRACT(MONTH FROM date) * 10000 + EXTRACT(DAY FROM date) * 100 + EXTRACT(HOUR FROM date) AS datetime_id,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(QUARTER FROM date) AS quarter,
    EXTRACT(MONTH FROM date) AS month,
    EXTRACT(DAY FROM date) AS day,
    LEFT(TO_CHAR(date, 'Month'), 3) AS monthname,
    TO_CHAR(date, 'Day') AS dayname,
    EXTRACT(WEEK FROM date) AS weekofyear,
    EXTRACT(WEEK FROM date) - EXTRACT(WEEK FROM DATE_TRUNC('month', date)) + 1 AS weekofmonth,
    EXTRACT(HOUR FROM date) AS hour
FROM date_cte;
