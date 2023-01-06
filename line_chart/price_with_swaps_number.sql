-- Token price with its count of swaps joined together
-- With token variable

SELECT a.bucket, a.price, b.count
FROM (SELECT p.bucket, p.close_stable as price
      FROM agg.chain_bsc.price_ticks_hourly p
      where p.bucket > timestamp '2022-10-01'
        and p.bucket < timestamp '2022-10-06'
        and p.token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
      ORDER BY 1) a
         LEFT JOIN
     (select bucket, sum(count) as count
      from agg.chain_bsc.swap_number_ticks_hourly
      where bucket > timestamp '2022-10-01'
        and bucket < timestamp '2022-10-06'
        and (token0_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82') or token1_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
      group by 1
      order by 1) b
     on a.bucket = b.bucket;