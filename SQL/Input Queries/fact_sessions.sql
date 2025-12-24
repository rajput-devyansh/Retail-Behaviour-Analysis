INSERT INTO fact_sessions
SELECT
    ROW_NUMBER() OVER () AS session_id,
    visitorid,
    MIN(event_time) AS session_start,
    MAX(event_time) AS session_end,
    ROUND(
        (strftime('%s', MAX(event_time)) - strftime('%s', MIN(event_time))) / 60.0,
        2
    ) AS duration_minutes
FROM session_numbers
GROUP BY visitorid, session_num;