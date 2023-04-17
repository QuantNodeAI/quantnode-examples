-- Get time series of Open Interest data

WITH pair AS (
    SELECT id
    FROM cex.binance.pairs
    WHERE symbol = 'BTCUSDT'
)
SELECT timestamp as time,
       open_interest,
       open_interest_value
FROM cex.binance.open_interests, pair
WHERE timestamp > timestamp '2023-04-14'
  and timestamp < timestamp '2023-04-16'
  and pair_id = pair.id
order by 1;