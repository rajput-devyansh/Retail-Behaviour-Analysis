-- Raw events
CREATE TABLE raw_events (
    event_ts_ms     INTEGER,
    visitorid       INTEGER,
    event_type      TEXT,
    itemid          INTEGER,
    transactionid   INTEGER
);

-- Raw item properties (merged later)
CREATE TABLE raw_item_properties (
    property_ts_ms  INTEGER,
    itemid          INTEGER,
    property        TEXT,
    value           TEXT
);

-- Raw category tree
CREATE TABLE raw_category_tree (
    categoryid          INTEGER,
    parent_categoryid   INTEGER
);