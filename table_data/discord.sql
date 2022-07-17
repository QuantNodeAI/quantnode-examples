-- Get discord messages for last day with given tag
SELECT id,
       channel_name,
       created_at,
       content,
       emotion,
       tag
FROM publications.discord_data
WHERE created_at >= now() - interval '1 day'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;