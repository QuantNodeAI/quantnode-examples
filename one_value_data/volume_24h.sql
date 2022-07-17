-- Traded volume in the last 24 hours of queried token (token is given by id)
-- if you do not know id of token, find it in the chain_bsc.tokens table or use this where cond:
-- token_id = ANY
--     (ARRAY(select id from chain_bsc.tokens where contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
-- instead of:
-- token_id = 23
SELECT sum(cast(volume as numeric))
FROM chain_bsc.volume_ticks_hourly
WHERE token_id = 23
  and bucket > now() - interval '24 hours';