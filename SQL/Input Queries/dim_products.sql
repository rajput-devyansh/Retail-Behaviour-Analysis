INSERT INTO dim_products
SELECT
    itemid,
    MAX(CASE WHEN property = 'categoryid' THEN CAST(value AS INTEGER) END) AS categoryid,
    MAX(CASE WHEN property = 'available' THEN CAST(value AS INTEGER) END) AS is_available,
    date(MIN(property_ts_ms) / 1000, 'unixepoch') AS first_seen_date,
    date(MAX(property_ts_ms) / 1000, 'unixepoch') AS last_seen_date
FROM raw.raw_item_properties
GROUP BY itemid;