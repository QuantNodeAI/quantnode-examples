-- Get time series of Open Interest data

WITH pair AS (
    SELECT id
    FROM agg.binance.pairs
    WHERE symbol = 'BTCUSDT'
)
SELECT timestamp as time,
       open_interest,
       open_interest_value
FROM agg.binance.open_interest_15_minutes, pair
WHERE timestamp > timestamp '2022-09-30'
  and timestamp < timestamp '2022-10-01'
  and pair_id = pair.id
order by 1;