-- Get traded volume in the last 24 hours for given token grouped by trading platform

SELECT *symbol('platform_id', 'bsc', 'platforms'),
        sum(cast(volume as decimal(38, 18))) as volume
FROM series.chain_bsc.volume_ticks_hourly
WHERE token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82', 56)
  and bucket > now() - interval '24' hour
GROUP BY 1
ORDER BY 2 desc;