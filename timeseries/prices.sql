-- Get token price hourly candles
SELECT (select symbol from chain_bsc.tokens t where t.id = p.token_id), *
FROM chain_bsc.price_ticks_hourly p
WHERE p.bucket > '2022-04-01'
  and p.bucket < '2022-04-13'
  and token_id = ANY
      (ARRAY(select id from chain_bsc.tokens where contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
ORDER BY bucket;