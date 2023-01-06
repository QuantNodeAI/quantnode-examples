-- Get timeseries data of members over time of given telegram chat

WITH chat as (SELECT id
              FROM pubs.telegram.chats
              WHERE name = 'binance_announcements')
SELECT date_trunc('hour', time) as time, avg(members) as members
FROM pubs.telegram.chat_stats, chat
WHERE time >= timestamp '2023-01-01'
  and time <= timestamp '2023-01-06'
  and chat_id = chat.id
GROUP BY 1
ORDER BY 1;