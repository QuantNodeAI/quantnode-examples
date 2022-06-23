SELECT (select p.name from chain_bsc.platforms p where p.id = platform_id), sum(cast(volume as numeric)) as volume
FROM chain_bsc.volume_ticks_hourly
WHERE token_id = 23
  and bucket > now() - interval '24 hours'
GROUP BY 1
ORDER BY 2 desc;