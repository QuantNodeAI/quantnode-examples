-- Get tag frequency in the twitter data for given time interval

SELECT tag, count(id) as count
FROM publications.tweets_data
where created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
group by tag
order by count desc;