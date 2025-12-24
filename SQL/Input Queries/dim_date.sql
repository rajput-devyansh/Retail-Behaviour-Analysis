INSERT INTO dim_date
SELECT DISTINCT
    CAST(strftime('%Y%m%d', event_time) AS INTEGER) AS date_key,
    date(event_time) AS date,
    CAST(strftime('%Y', event_time) AS INTEGER) AS year,
    CAST(strftime('%m', event_time) AS INTEGER) AS month,
    CAST(strftime('%d', event_time) AS INTEGER) AS day,
    CAST(strftime('%W', event_time) AS INTEGER) AS week,
    ((CAST(strftime('%m', event_time) AS INTEGER) - 1) / 3) + 1 AS quarter,
    CASE 
        WHEN strftime('%w', event_time) IN ('0','6') THEN 1 
        ELSE 0 
    END AS is_weekend
FROM fact_events;