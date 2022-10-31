-- Get token price together with its telegram activity
-- With token as a variable

WITH token AS (SELECT id,
                      symbol,
                      'eth' as tag
               FROM chain_eth.tokens
               WHERE contract = '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2')
SELECT a.bucket, a.price, b.count
FROM (SELECT p.bucket, last(p.close_stable, p.bucket) as price
      FROM chain_eth.price_ticks_hourly p,
           token
      where p.bucket > '2022-10-05'
        and p.bucket < '2022-10-06'
        and p.token_id = token.id
      GROUP BY 1
      ORDER BY 1) a
         LEFT JOIN
     (SELECT time_bucket('1 hour', created_at) as bucket, count(d.id)
      FROM publications.telegram_data d,
           token
      where created_at >= '2022-10-05'
        and created_at <= '2022-10-06'
        and d.tag in (token.tag)
      group by 1
      order by 1) b
     on a.bucket = b.bucket;