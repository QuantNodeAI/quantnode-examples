-- Get the most active telegram chats about some given tag (token)

SELECT chat_id, c.name as chat_name, count(messages.id) as messages_number
FROM pubs.telegram.messages join pubs.telegram.chats c on c.id = messages.chat_id
WHERE messages.created_at >= timestamp '2022-08-01'
  and messages.created_at <= timestamp '2022-08-03'
  and contains(tags, 'eth')
GROUP BY chat_id, 2
order by messages_number desc
limit 10;