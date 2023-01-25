-- Timeseries of liquidity in th LP pool of queried lp token by its contract (liquidity of token0 and token1 in the pool)

WITH lp_token AS (
    SELECT id
    FROM bsc.public.lp_tokens
    WHERE contract = '0x2d9b4109ed85F40Ef2fBFaa16539c7b156974Da3'
)
SELECT bucket as time, liquidity0, liquidity1
FROM series.chain_bsc.liquidity_ticks_hourly, lp_token
WHERE bucket > timestamp '2022-04-01'
  and bucket < timestamp '2022-04-12'
  and token_id = lp_token.id
ORDER BY 1;