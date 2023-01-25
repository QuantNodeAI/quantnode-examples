-- Get token price hourly candles
SELECT (select symbol from bsc.public.tokens t where t.id = p.token_id), *
FROM series.chain_bsc.price_ticks_hourly p
WHERE p.bucket > timestamp '2022-04-01'
  and p.bucket < timestamp '2022-04-13'
  and token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
ORDER BY bucket;