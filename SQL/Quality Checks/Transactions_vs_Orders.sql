-- This SQL script checks for discrepancies between the number of transactions recorded in fact_events and the number of orders in fact_orders.

INSERT INTO dq_checks
SELECT
    date('now'),
    'transactions_vs_orders',
    'fact_orders',
    'transaction_count_difference',
    (
        (SELECT COUNT(*) FROM fact_events WHERE event_type = 'transaction')
        -
        (SELECT COUNT(*) FROM fact_orders)
    ) * 1.0;