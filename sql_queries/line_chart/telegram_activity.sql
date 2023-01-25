-- Get Telegram activity for given tag as a time series data gir given time interval

SELECT date_trunc('hour', created_at) as time, count(id) as count
FROM pubs.telegram.messages
where created_at >= timestamp '2022-07-22'
  and created_at <= timestamp '2022-07-23'
  and contains(tags, 'eth')
group by 1
order by 1;