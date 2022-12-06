-- Get token price together with its telegram activity
-- With token as a variable

WITH token AS (SELECT id,
                      symbol,
                      'eth' as tag
               FROM binance.pairs
               WHERE symbol = 'ETHUSDT')
SELECT a.bucket, a.price, b.count
FROM (SELECT p.bucket, last_value(p.close_stable) OVER (PARTITION BY bucket) as price
      FROM binance.price_ticks_hourly p,
           token
      where p.bucket > timestamp '2022-10-05'
        and p.bucket < timestamp '2022-10-06'
        and p.token_id = token.id
      ORDER BY 1) a
         LEFT JOIN
     (select bucket, count from publications.public.telegram_data_1_hour_count cnt, token 
      where cnt.tag in (token.tag) and bucket >= timestamp '2022-10-05' and bucket < timestamp '2022-10-06') b
     on a.bucket = b.bucket;
