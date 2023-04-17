-- Get hourly TOHLCV candles for given pair from the Bitfinex exchange
SELECT time, open, high, low, close, volume, trades
FROM cex.bitfinex.candles_hourly join cex.bitfinex.pairs p
on p.id = candles_hourly.pair_id
WHERE time >= now() - interval '15' day
  and p.symbol = 'BTCUSD'
ORDER BY time;