-- Get traded volume in the last 24 hours for given token grouped by trading platform
-- if you do not know id of token, find it in the chain_bsc.tokens table or use this where cond:
-- token_id = ANY
--     (ARRAY(select id from chain_bsc.tokens where contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
-- instead of:
-- token_id = 23
SELECT (select p.name from chain_bsc.platforms p where p.id = platform_id), sum(cast(volume as numeric)) as volume
FROM chain_bsc.volume_ticks_hourly
WHERE token_id = 23
  and bucket > now() - interval '24 hours'
GROUP BY 1
ORDER BY 2 desc;