-- Get timeseries data of members over time of given telegram chat

SELECT time_bucket('1 hour', time) as time, last(value, time) as members
FROM publications.telegram_chat_members
WHERE time >= '2022-08-01'
--   and time <= '2022-08-03'
  and chat_id = ANY (ARRAY (select id from publications.telegram_chats where name = 'binance_announcements'))
GROUP BY 1
ORDER BY 1;