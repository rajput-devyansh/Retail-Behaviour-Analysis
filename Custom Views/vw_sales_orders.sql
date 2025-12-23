-- Used for: Revenue dashboards,Profit analysis, Time-based reporting
-- One row = one purchased item

CREATE VIEW vw_sales_orders AS
SELECT
    o.order_id,
    o.visitorid,
    o.itemid,
    d.date              AS order_date,
    d.year,
    d.month,
    d.week,
    p.categoryid,
    c.parent_categoryid,
    o.revenue,
    o.cost,
    o.profit
FROM fact_orders o
JOIN dim_date d
  ON d.date = o.order_date
LEFT JOIN dim_products p
  ON o.itemid = p.itemid
LEFT JOIN dim_categories c
  ON p.categoryid = c.categoryid;