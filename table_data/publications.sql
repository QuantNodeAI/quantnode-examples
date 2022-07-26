-- -- Get publications for time interval with given tag

SELECT id,
       title,
       published_at,
       created_at,
       source,
       text,
       emotion,
       tag
FROM publications.publications_data
WHERE created_at >= '2022-07-22'
  and created_at <= '2022-07-23'
  and tag in ('cardano')
ORDER BY created_at DESC
LIMIT 10;