-- Get tokens by its liquidity against the biggest tokens (WETH, USDT, USDC) on ETH

SELECT token_id,
       (select symbol from chain_eth.tokens t where t.id = token_id),
       sum(liquidity_usd) as liquidity
FROM chain_eth.token_liquidities
WHERE against_id in (2, 3, 8)
group by token_id
order by liquidity desc
limit 10;