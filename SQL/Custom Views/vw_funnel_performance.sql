-- Used for: Funnel dashboards, Conversion analysis, Drop-off insights
-- One row = visitor * item

CREATE VIEW vw_funnel_performance AS
SELECT
    f.visitorid,
    f.itemid,
    p.categoryid,
    c.parent_categoryid,
    f.viewed,
    f.added_to_cart,
    f.purchased
FROM fact_funnel f
LEFT JOIN dim_products p
  ON f.itemid = p.itemid
LEFT JOIN dim_categories c
  ON p.categoryid = c.categoryid;