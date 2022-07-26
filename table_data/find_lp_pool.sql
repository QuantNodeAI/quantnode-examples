-- Find all LP Pools for given token

SELECT name, symbol, decimals, total_supply, contract
FROM chain_bsc.lp_tokens
WHERE token0_id = ANY
      (ARRAY(SELECT id from chain_bsc.tokens t where t.contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
   or token1_id = ANY
      (ARRAY(SELECT id from chain_bsc.tokens t where t.contract = '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
ORDER BY id
LIMIT 10;