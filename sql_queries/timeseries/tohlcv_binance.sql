-- Get hourly TOHLCV candles for given pair from the Binance exchange

SELECT time, open, high, low, close, volume, trades
FROM cex.binance.candles_hourly join cex.binance.pairs p
on p.id = candles_hourly.pair_id
WHERE time >= now() - interval '15' day
  and p.symbol = 'BTCUSDT'
ORDER BY time;