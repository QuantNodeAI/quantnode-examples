SELECT time_bucket('1 hour', price.bucket) as time,
       last(close_stable, close_time)      as close,
       first(open_stable, open_time)       as open,
       max(high_stable)                    as high,
       min(low_stable)                     as low,
       sum(cast(v.volume as numeric))      as volume
FROM binance.price_ticks_hourly price
    join binance.pairs pairs on (price.token_id = pairs.id)
    join binance.volume_ticks_hourly v
    on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
WHERE price.bucket >= '2022-06-27'
  and price.bucket <= '2022-06-30'
  and pairs.symbol = 'BTCUSDT'
GROUP BY time
ORDER BY time;