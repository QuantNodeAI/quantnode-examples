-- Get reddit messages for given time interval with given tag

SELECT id,
       title,
       subreddit_name,
       created_at,
       content,
       emotion,
       tag
FROM publications.reddit_data
WHERE created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;