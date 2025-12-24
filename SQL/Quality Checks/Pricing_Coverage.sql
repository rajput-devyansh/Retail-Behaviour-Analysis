-- This SQL script checks for missing pricing information in the fact_orders table.

INSERT INTO dq_checks
SELECT
    date('now'),
    'missing_pricing',
    'fact_orders',
    'orders_without_price',
    COUNT(*) * 1.0
FROM fact_orders
WHERE revenue IS NULL
   OR cost IS NULL;