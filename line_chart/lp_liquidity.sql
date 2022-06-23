SELECT bucket as time, liquidity0, liquidity1
FROM chain_bsc.liquidity_ticks_hourly
WHERE bucket > '2022-04-01'
  and bucket < '2022-04-13'
  and token_id = ANY
    (ARRAY(select id from chain_bsc.lp_tokens where contract = '0x2d9b4109ed85F40Ef2fBFaa16539c7b156974Da3'))
ORDER BY 1;