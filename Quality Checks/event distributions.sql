-- This SQL script checks distribution by calculating the volume of events by their typ

INSERT INTO dq_checks
SELECT
    date('now'),
    'event_distribution',
    'fact_events',
    event_type,
    COUNT(*) * 1.0
FROM fact_events
GROUP BY event_type;