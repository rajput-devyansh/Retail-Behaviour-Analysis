INSERT INTO dim_categories (categoryid, parent_categoryid)
SELECT DISTINCT
    categoryid,
    parent_categoryid
FROM raw.raw_category_tree;

UPDATE dim_categories
SET category_level = 
    CASE 
        WHEN parent_categoryid IS NULL THEN 1
        ELSE 2
    END;