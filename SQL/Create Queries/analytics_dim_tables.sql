CREATE TABLE dim_date (
    date_key       INTEGER PRIMARY KEY,
    date           TEXT,
    year           INTEGER,
    month          INTEGER,
    day            INTEGER,
    week           INTEGER,
    quarter        INTEGER,
    is_weekend     INTEGER
);

CREATE TABLE dim_categories (
    categoryid        INTEGER PRIMARY KEY,
    parent_categoryid INTEGER,
    category_level    INTEGER
);

CREATE TABLE dim_products (
    itemid          INTEGER PRIMARY KEY,
    categoryid      INTEGER,
    is_available    INTEGER,
    first_seen_date TEXT,
    last_seen_date  TEXT
);

CREATE TABLE dim_pricing (
    itemid      INTEGER PRIMARY KEY,
    price       REAL,
    cost        REAL,
    margin      REAL
);