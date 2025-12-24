-- This SQL script checks for funnel consistency by identifying users who have made a purchase without viewing the product.

INSERT INTO dq_checks
SELECT
    date('now'),
    'funnel_consistency',
    'fact_funnel',
    'purchased_without_view',
    COUNT(*) * 1.0
FROM fact_funnel
WHERE purchased = 1
  AND viewed = 0;