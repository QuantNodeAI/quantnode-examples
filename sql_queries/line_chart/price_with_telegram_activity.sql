-- Get token price together with its telegram activity
-- With token as a variable

WITH token AS (SELECT id,
                      symbol,
                      'eth' as tag
               FROM cex.binance.pairs
               WHERE symbol = 'ETHUSDT')
SELECT a.bucket, a.price, b.count
FROM (SELECT p.bucket, p.close_stable as price
      FROM cex.binance.price_ticks_hourly p,
           token
      where p.bucket > timestamp '2022-10-05'
        and p.bucket < timestamp '2022-10-06'
        and p.token_id = token.id
      ORDER BY 1) a
         LEFT JOIN
     (select date_trunc('hour', created_at) as bucket,
             count(message_id) as count
      from pubs.telegram.messages cnt, token
      where contains(tags, 'eth')
        and created_at >= timestamp '2022-10-05' and created_at < timestamp '2022-10-06'
      GROUP BY 1
      ORDER BY 1) b
     on a.bucket = b.bucket;
