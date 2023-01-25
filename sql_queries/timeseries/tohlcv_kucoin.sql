-- Get hourly TOHLCV candles for given pair from the Kucoin exchange
SELECT price.bucket as time,
       close_stable as close,
       open_stable  as open,
       high_stable  as high,
       low_stable   as low,
       v.volume     as volume
FROM cex.kucoin.price_ticks_hourly price
         join cex.kucoin.pairs pairs on (price.token_id = pairs.id)
         join cex.kucoin.volume_ticks_hourly v
              on (price.bucket = v.bucket and price.token_id = v.token_id and price.platform_id = v.platform_id)
WHERE price.bucket >= now() - interval '5' day
  and pairs.symbol = 'ETH-USDT'
ORDER BY 1;