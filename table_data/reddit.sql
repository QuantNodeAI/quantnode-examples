-- Get reddit messages for last day with given tag
SELECT id,
       title,
       subreddit_name,
       created_at,
       content,
       emotion,
       tag
FROM publications.reddit_data
WHERE created_at >= now() - interval '1 day'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;