-- Get hourly TOHLCV candles for given pair from the Bitfinex exchange
SELECT time_bucket('1 hour', price.bucket) as time,
       last(close_stable, close_time)      as close,
       first(open_stable, open_time)       as open,
       max(high_stable)                    as high,
       min(low_stable)                     as low,
       sum(cast(v.volume as numeric))      as volume
FROM bitfinex.price_ticks_hourly price
    join bitfinex.volume_ticks_hourly v
on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
WHERE price.bucket >= now() - interval '5 days'
  and pairs.symbol = ANY (ARRAY(select id from bitfinex.pairs where symbol = 'BTCUSD'))
GROUP BY time
ORDER BY time;