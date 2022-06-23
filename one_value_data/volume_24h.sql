SELECT sum(cast(volume as numeric))
FROM chain_bsc.volume_ticks_hourly
WHERE token_id = 23
  and bucket > now() - interval '24 hours';