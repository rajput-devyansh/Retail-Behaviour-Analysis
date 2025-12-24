-- This Script counts the number of sessions with negative or zero duration.

INSERT INTO dq_checks
SELECT
    date('now'),
    'session_duration_check',
    'fact_sessions',
    'negative_or_zero_duration',
    COUNT(*) * 1.0
FROM fact_sessions
WHERE duration_minutes < 0;