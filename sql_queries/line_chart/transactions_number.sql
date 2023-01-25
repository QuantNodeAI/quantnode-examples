-- Get time series of number of transactions in time

SELECT date_trunc('hour', confirmed_at) as time, count(id) as count
FROM bsc.public.transactions
WHERE confirmed_at > timestamp '2022-07-01'
  and confirmed_at < timestamp '2022-07-05'
GROUP BY 1
ORDER BY 1;