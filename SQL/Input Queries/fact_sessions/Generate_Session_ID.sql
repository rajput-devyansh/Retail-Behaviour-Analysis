CREATE TEMP VIEW session_numbers AS
SELECT
    visitorid,
    event_time,
    SUM(is_new_session) OVER (
        PARTITION BY visitorid
        ORDER BY event_time
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS session_num
FROM session_flags;