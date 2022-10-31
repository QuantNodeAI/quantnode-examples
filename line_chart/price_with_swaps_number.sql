-- Token price with its count of swaps joined together
-- With token variable

WITH token AS (
    SELECT
        id,
        symbol
    FROM chain_bsc.tokens
    WHERE contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'
)
SELECT a.bucket, a.price, b.count
FROM (SELECT p.bucket, last(p.close_stable, p.bucket) as price
      FROM chain_bsc.price_ticks_hourly p, token
      where p.bucket > '2022-10-01'
        and p.bucket < '2022-10-06'
        and p.token_id = token.id
      GROUP BY 1
      ORDER BY 1) a
         LEFT JOIN
     (select bucket, sum(count) as count
      from chain_bsc.swap_number_ticks_hourly, token
      where bucket > '2022-10-01'
        and bucket < '2022-10-06'
        and (token0_id = token.id or token1_id = token.id)
      group by 1
      order by 1) b
     on a.bucket = b.bucket;