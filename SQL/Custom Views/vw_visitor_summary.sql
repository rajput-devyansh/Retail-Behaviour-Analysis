-- Used for: Customer / visitor segmentation, Behavioral analysis
-- One row = one visitor

CREATE VIEW vw_visitor_summary AS
SELECT
    s.visitorid,
    COUNT(DISTINCT s.session_id)           AS total_sessions,
    COUNT(DISTINCT o.order_id)             AS total_orders,
    COALESCE(SUM(o.revenue), 0)            AS total_revenue
FROM fact_sessions s
LEFT JOIN fact_orders o
  ON s.visitorid = o.visitorid
GROUP BY s.visitorid;