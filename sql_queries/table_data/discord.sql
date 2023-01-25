-- Get discord messages for given time interval with given tag

SELECT *
FROM pubs.discord.messages
where created_at >= timestamp '2022-07-22'
  and created_at <= timestamp '2022-07-23'
  and contains(tags, 'cardano')
ORDER BY created_at DESC
LIMIT 10;