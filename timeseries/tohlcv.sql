-- Get hourly TOHLCV candles for given token
SELECT p.bucket as time, open_stable, high_stable, low_stable, close_stable, v.volume
FROM agg.chain_bsc.price_ticks_hourly p
         join agg.chain_bsc.volume_ticks_hourly v
              on (p.bucket = v.bucket and p.token_id = v.token_id and p.platform_id = v.platform_id)
WHERE p.token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
  and p.bucket > timestamp '2022-04-01'
  and p.bucket < timestamp '2022-04-13'
ORDER BY time;