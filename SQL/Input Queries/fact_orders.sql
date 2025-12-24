INSERT INTO fact_orders
SELECT
    e.transactionid AS order_id,
    e.visitorid,
    e.itemid,
    date(e.event_time) AS order_date,
    p.price AS revenue,
    p.cost,
    p.price - p.cost AS profit
FROM fact_events e
JOIN dim_pricing p
  ON e.itemid = p.itemid
WHERE e.event_type = 'transaction';