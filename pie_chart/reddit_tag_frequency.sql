-- Get tag frequency in all reddit messages for given time interval

SELECT tag, count(id) as count
FROM publications.reddit_data
where created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
group by tag
order by count desc;