-- Token price with its chain activity by means of active unique addresses with any movement
WITH token AS (SELECT id, symbol FROM chain_bsc.tokens WHERE contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
SELECT a.bucket, a.open_price, a.high_price, a.low_price, a.close_price, b.unique_wallets
FROM (SELECT p.bucket,
             first(p.open_stable, p.bucket) as open_price,
             max(p.high_stable)             as high_price,
             min(p.low_stable)              as low_price,
             last(p.close_stable, p.bucket) as close_price
      FROM chain_bsc.price_ticks_hourly p,
           token
      where p.bucket > '2022-10-22'
        and p.bucket < '2022-10-31'
        and p.token_id = token.id
      GROUP BY 1
      ORDER BY 1) a
         LEFT JOIN
     (SELECT bucket, count(distinct wallet_id) as unique_wallets
      FROM chain_bsc.balance_move_ticks_hourly,
           token
      WHERE bucket >= '2022-10-22'
        and bucket <= '2022-10-31'
        and token_id = token.id
      group by bucket
      ORDER BY bucket) b on a.bucket = b.bucket;