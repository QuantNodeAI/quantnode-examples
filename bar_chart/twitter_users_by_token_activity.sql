-- Get the most active twitter users for given tag (token)

WITH tt as (SELECT user_id, count(id) as messages_number
            FROM pubs.twitter.tweets
            WHERE created_at >= timestamp '2022-08-01 12:00:00'
              and created_at <= timestamp '2022-08-01 18:00:00'
              and contains(tags, 'eth')
            GROUP BY user_id
            ORDER BY messages_number DESC
            LIMIT 10)
SELECT users.name, tt.user_id, tt.messages_number
from pubs.twitter.users,
     tt
where users.id = tt.user_id
order by messages_number DESC;