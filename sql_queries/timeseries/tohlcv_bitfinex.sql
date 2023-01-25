-- Get hourly TOHLCV candles for given pair from the Bitfinex exchange
SELECT price.bucket as time,
       close_stable as close,
       open_stable  as open,
       high_stable  as high,
       low_stable   as low,
       v.volume     as volume
FROM cex.bitfinex.price_ticks_hourly price
         join cex.bitfinex.pairs pairs on (price.token_id = pairs.id)
         join cex.bitfinex.volume_ticks_hourly v
              on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
WHERE price.bucket >= now() - interval '5' day
  and pairs.symbol = 'BTCUSD'
ORDER BY 1;