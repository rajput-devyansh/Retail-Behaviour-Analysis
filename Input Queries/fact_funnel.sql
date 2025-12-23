INSERT INTO fact_funnel
SELECT
    visitorid,
    itemid,
    MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
    MAX(CASE WHEN event_type = 'addtocart' THEN 1 ELSE 0 END) AS added_to_cart,
    MAX(CASE WHEN event_type = 'transaction' THEN 1 ELSE 0 END) AS purchased
FROM fact_events
GROUP BY visitorid, itemid;