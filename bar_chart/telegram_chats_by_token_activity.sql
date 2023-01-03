-- Get the most active telegram chats about some given tag (token)

SELECT chat_id, first(c.name, c.created_at) as chat_name, count(messages.id) as messages_number
FROM telegram.messages join telegram.chats c on c.id = messages.chat_id
WHERE messages.created_at >= '2022-08-01'
  and messages.created_at <= '2022-08-03'
  and 'eth' = any (tags)
GROUP BY chat_id
order by messages_number desc
limit 10;