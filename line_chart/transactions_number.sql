-- Get time series of number of transactions in time

SELECT time_bucket('1 hour', confirmed_at) as time, count(id) as count
FROM chain_bsc.transactions
WHERE confirmed_at > '2022-07-01'
  and confirmed_at < '2022-07-05'
GROUP BY 1
ORDER BY 1;