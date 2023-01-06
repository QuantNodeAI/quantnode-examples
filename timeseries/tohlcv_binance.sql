-- Get hourly TOHLCV candles for given pair from the Binance exchange
SELECT price.bucket as time,
       close_stable as close,
       open_stable  as open,
       high_stable  as high,
       low_stable   as low,
       v.volume     as volume
FROM agg.binance.price_ticks_hourly price
         join agg.binance.pairs pairs on (price.token_id = pairs.id)
         join agg.binance.volume_ticks_hourly v
              on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
WHERE price.bucket >= timestamp '2022-06-27'
  and price.bucket <= timestamp '2022-06-30'
  and pairs.symbol = 'BTCUSDT'
ORDER BY 1;