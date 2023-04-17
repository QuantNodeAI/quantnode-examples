-- Get sentiment of Reddit messages in the given subreddit for given time interval
WITH subreddit as (SELECT id
                   FROM pubs.reddit.subreddits
                   WHERE name = 'binance')
SELECT date_trunc('hour', created_at) as time, avg(emotion) as emotion
FROM pubs.reddit.posts,
     subreddit
where created_at >= timestamp '2022-07-22'
  and created_at <= timestamp '2022-07-23'
  and subreddit_id = subreddit.id
group by 1
order by 1;