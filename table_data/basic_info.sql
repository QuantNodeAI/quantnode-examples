-- Basic information and analysis for given token and chain/exchange by its id
-- if you do not know id of token, find it in the chain_bsc.tokens table or use this where condition:
-- token_id = ANY
--     (ARRAY(select id from chain_bsc.tokens where contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
-- instead of:
-- token_id = 23
SELECT *
FROM screener.analyses
WHERE token_id = 23
  and chain = 56;