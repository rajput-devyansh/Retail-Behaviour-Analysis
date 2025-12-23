-- This Script counts the number of orphan products in fact_events table.

INSERT INTO dq_checks
SELECT
    date('now'),
    'orphan_products',
    'fact_events',
    'events_without_product',
    COUNT(*) * 1.0
FROM fact_events e
LEFT JOIN dim_products p
  ON e.itemid = p.itemid
WHERE p.itemid IS NULL;