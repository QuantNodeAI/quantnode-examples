-- Get the most active telegram chats about some given tag (token)

SELECT chat_id, first(chat_name, created_at) as chat_name, count(id) as messages_number
FROM publications.telegram_data
WHERE created_at >= '2022-08-01'
  and created_at <= '2022-08-03'
  and tag = 'eth'
GROUP BY chat_id
order by messages_number desc
limit 10;