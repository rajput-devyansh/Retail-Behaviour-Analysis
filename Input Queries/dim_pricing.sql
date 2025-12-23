INSERT INTO dim_pricing
SELECT
    itemid,
    ROUND((abs(itemid) % 50) + 10, 2) AS price,
    ROUND(((abs(itemid) % 50) + 10) * 0.7, 2) AS cost,
    ROUND(((abs(itemid) % 50) + 10) * 0.3, 2) AS margin
FROM dim_products;