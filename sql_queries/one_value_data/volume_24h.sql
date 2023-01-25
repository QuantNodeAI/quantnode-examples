-- Traded volume in the last 24 hours of queried token (token is given by id)

SELECT sum(cast(volume as decimal(38, 18))) as volume
FROM series.chain_bsc.volume_ticks_hourly
WHERE token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
  and bucket > now() - interval '24' hour;