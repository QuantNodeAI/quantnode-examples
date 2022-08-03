-- Get the most active twitter users for given tag (token)

SELECT (select u.name from publications.twitter_users u where u.id = tweets_data.user_id), count(id) as messages_number
FROM publications.tweets_data
WHERE created_at >= '2022-08-01 12:00:00'
  and created_at <= '2022-08-01 18:00:00'
  and tag = 'eth'
GROUP BY user_id
ORDER BY messages_number DESC
LIMIT 10;