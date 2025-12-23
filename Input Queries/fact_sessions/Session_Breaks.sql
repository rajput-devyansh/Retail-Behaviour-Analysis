CREATE TEMP VIEW session_flags AS
SELECT
    curr.visitorid,
    curr.event_time,
    CASE
        WHEN prev.event_time IS NULL THEN 1
        WHEN (strftime('%s', curr.event_time) - strftime('%s', prev.event_time)) > 1800 THEN 1
        ELSE 0
    END AS is_new_session
FROM ordered_events curr
LEFT JOIN ordered_events prev
  ON curr.visitorid = prev.visitorid
 AND curr.rn = prev.rn + 1;