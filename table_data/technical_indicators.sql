-- Get all technical indicators and candle patterns for given token and chain given by its ID
-- if you do not know id of token, find it in the chain_bsc.tokens table or use this where cond:
-- token_id = ANY
--     (ARRAY(select id from chain_bsc.tokens where contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
-- instead of:
-- token_id = 23
SELECT *
FROM screener.time_frame_analyses
WHERE token_id = 23
  and chain = 56;