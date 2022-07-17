-- Get token price hourly candles
SELECT *
FROM chain_bsc.price_ticks_hourly p
         inner join chain_bsc.tokens t on (t.id = p.token_id)
WHERE t.contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'
  and p.bucket > '2022-04-01'
  and p.bucket < '2022-04-13'
ORDER BY bucket;