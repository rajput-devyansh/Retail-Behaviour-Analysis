-- Used for: Engagement analysis, Session trends,Conversion per session
-- One row = one session

CREATE VIEW vw_session_metrics AS
SELECT
    s.session_id,
    s.visitorid,
    date(s.session_start) AS session_date,
    d.year,
    d.month,
    d.week,
    s.duration_minutes
FROM fact_sessions s
JOIN dim_date d
  ON d.date = date(s.session_start);