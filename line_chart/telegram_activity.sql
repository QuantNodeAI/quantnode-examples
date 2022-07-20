-- Get Telegram activity for given tag as a time series data for last 24 hours
SELECT time_bucket('1 hour', sent_at) as time, count(id)
FROM publications.telegram_data
where sent_at >= now() - interval '1 day'
  and tag in ('eth')
group by 1
order by 1;