-- Get sentiment of Reddit messages in the given subreddit for given time interval
SELECT time_bucket('1 hour', created_at) as time, avg(emotion)
FROM publications.reddit_data
where created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
  and subreddit_name = 'binance'
group by 1
order by 1;