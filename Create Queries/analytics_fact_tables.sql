CREATE TABLE fact_events (
    event_time     TEXT,
    visitorid      INTEGER,
    itemid         INTEGER,
    event_type     TEXT,
    transactionid INTEGER
);

CREATE TABLE fact_orders (
    order_id    INTEGER,
    visitorid   INTEGER,
    itemid      INTEGER,
    order_date  TEXT,
    revenue     REAL,
    cost        REAL,
    profit      REAL
);

CREATE TABLE fact_sessions (
    session_id       INTEGER PRIMARY KEY,
    visitorid        INTEGER,
    session_start    TEXT,
    session_end      TEXT,
    duration_minutes REAL
);

CREATE TABLE fact_funnel (
    visitorid       INTEGER,
    itemid          INTEGER,
    viewed          INTEGER,
    added_to_cart   INTEGER,
    purchased       INTEGER
);