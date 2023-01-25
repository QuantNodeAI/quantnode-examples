-- Find all LP Pools for given token

SELECT name, symbol, decimals, total_supply, contract
FROM bsc.public.lp_tokens
WHERE token0_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
   or token1_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
ORDER BY id
LIMIT 10;