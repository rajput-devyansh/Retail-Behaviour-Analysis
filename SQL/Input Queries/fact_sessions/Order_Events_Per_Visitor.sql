CREATE TEMP VIEW ordered_events AS
SELECT
    visitorid,
    event_time,
    ROW_NUMBER() OVER (
        PARTITION BY visitorid
        ORDER BY event_time
    ) AS rn
FROM fact_events;