INSERT INTO fact_events
SELECT
    datetime(event_ts_ms / 1000, 'unixepoch') AS event_time,
    visitorid,
    itemid,
    event_type,
    transactionid
FROM raw.raw_events;