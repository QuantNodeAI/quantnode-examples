-- Sort binance Pairs by its slope of Open Interest data through given time interval

SELECT (select symbol from binance.pairs where id = interest.pair_id) as pair,
       regr_slope(CAST(open_interest as decimal), to_unixtime(timestamp)) AS slope
FROM binance.open_interest_15_minutes interest
where timestamp > timestamp '2022-09-30'
  and timestamp < timestamp '2022-10-01'
GROUP BY pair_id
ORDER BY slope desc;
