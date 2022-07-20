-- Get twitter activity for given tag in the last 24 hours
SELECT time_bucket('1 hour', created_at) as time, count(id)
FROM publications.tweets_data
where created_at >= now() - interval '1 day'
  and tag in ('eth')
group by 1
order by 1;