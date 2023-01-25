-- Get 15 minutes TOHLCV candles with open interest data for given pair from the Binance exchange

SELECT price.bucket          as time,
       close_stable          as close,
       open_stable           as open,
       high_stable           as high,
       low_stable            as low,
       v.volume              as volume,
       i.open_interest       as open_interest,
       i.open_interest_value as open_interest_value
FROM cex.binance.price_ticks_15_minutes price
         join cex.binance.pairs pairs on (price.token_id = pairs.id)
         join cex.binance.volume_ticks_hourly v
              on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
         join cex.binance.open_interest_15_minutes i
              on (price.bucket = i.timestamp and price.token_id = i.pair_id)
WHERE price.bucket >= timestamp '2022-09-30'
  and price.bucket <= timestamp '2022-10-01'
  and pairs.symbol = 'BTCUSDT'
ORDER BY 1;