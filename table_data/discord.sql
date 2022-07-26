-- Get discord messages for given time interval with given tag

SELECT id,
       channel_name,
       created_at,
       content,
       emotion,
       tag
FROM publications.discord_data
where created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;