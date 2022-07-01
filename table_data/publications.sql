SELECT id,
       title,
       published_at,
       created_at,
       source,
       text,
       emotion,
       tag
FROM publications.publications_data
WHERE created_at >= now() - interval '1 day'
  and tag in ('cardano')
ORDER BY created_at DESC
    LIMIT 10;