SELECT COUNT(*) FROM raw_events;
SELECT COUNT(*) FROM raw_item_properties;
SELECT COUNT(*) FROM raw_category_tree;

SELECT event_type, COUNT(*) 
FROM raw_events 
GROUP BY event_type;