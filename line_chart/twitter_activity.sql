-- Get twitter activity for given tag for given time interval

SELECT time_bucket('1 hour', created_at) as time, count(id)
FROM publications.tweets_data
where created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
  and tag in ('eth')
group by 1
order by 1;