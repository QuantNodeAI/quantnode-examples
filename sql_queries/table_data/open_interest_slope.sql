-- Sort binance Pairs by its slope of Open Interest data through given time interval

SELECT (select symbol from cex.binance.pairs where id = interest.pair_id) as pair,
       regr_slope(CAST(open_interest as decimal(38, 18)), to_unixtime(timestamp)) AS slope
FROM cex.binance.open_interests interest
where timestamp > timestamp '2023-04-15'
  and timestamp < timestamp '2023-04-16'
GROUP BY pair_id
ORDER BY slope desc;
