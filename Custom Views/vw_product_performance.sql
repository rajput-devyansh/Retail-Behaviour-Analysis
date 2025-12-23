-- Used for: Product rankings, Category contribution, Margin analysis
-- One row = one product

CREATE VIEW vw_product_performance AS
SELECT
    p.itemid,
    p.categoryid,
    c.parent_categoryid,
    COUNT(o.order_id)           AS total_orders,
    SUM(o.revenue)              AS total_revenue,
    SUM(o.profit)               AS total_profit
FROM dim_products p
LEFT JOIN fact_orders o
  ON p.itemid = o.itemid
LEFT JOIN dim_categories c
  ON p.categoryid = c.categoryid
GROUP BY
    p.itemid,
    p.categoryid,
    c.parent_categoryid;