-- Token price with its chain activity by means of active unique addresses with any movement
SELECT a.bucket, a.open_price, a.high_price, a.low_price, a.close_price, b.unique_wallets
FROM (SELECT p.bucket,
             p.open_stable as open_price,
             p.high_stable             as high_price,
             p.low_stable              as low_price,
             p.close_stable as close_price
      FROM agg.chain_bsc.price_ticks_hourly p
      where p.bucket > timestamp '2022-10-22'
        and p.bucket < timestamp '2022-10-31'
        and p.token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
      ORDER BY 1) a
         LEFT JOIN
     (SELECT bucket, count(distinct wallet_id) as unique_wallets
      FROM agg.chain_bsc.balance_move_ticks_hourly
      WHERE bucket >= timestamp '2022-10-22'
        and bucket <= timestamp '2022-10-31'
        and token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
      group by bucket
      ORDER BY bucket) b on a.bucket = b.bucket;