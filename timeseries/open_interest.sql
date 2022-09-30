-- Get time series of Open Interest data

SELECT time_bucket('15 minutes', timestamp) as time,
       sum(CAST(open_interest as numeric)) as open_interest,
       sum(CAST(open_interest_value as numeric)) as open_interest_value
FROM binance.open_interest_15_minutes
WHERE timestamp > '2022-09-30'
  and timestamp < '2022-10-01'
  and pair_id = 1
group by time
order by time;