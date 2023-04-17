-- Get hourly TOHLCV candles for given pair from the Kucoin exchange
SELECT time, open, high, low, close, volume, trades
FROM cex.kucoin.candles_hourly join cex.kucoin.pairs p
on p.id = candles_hourly.pair_id
WHERE time >= now() - interval '15' day
  and p.symbol = 'ETH-USDT'
ORDER BY time;