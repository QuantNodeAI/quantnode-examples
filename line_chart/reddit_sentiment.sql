-- Get sentiment of Reddit messages in the given subreddit for last 24 hours
SELECT time_bucket('1 hour', created_at) as time, avg(emotion)
FROM publications.reddit_data
where created_at >= now() - interval '1 day'
  and subreddit_name = 'binance'
group by 1
order by 1;