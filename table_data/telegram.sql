-- Get telegram messages for last day with given tag
SELECT id,
       chat_name,
       created_at,
       content,
       emotion,
       tag
FROM publications.telegram_data
WHERE created_at >= now() - interval '1 day'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;