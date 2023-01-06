-- Get tokens by its liquidity against the biggest tokens (WETH, USDT, USDC) on ETH

SELECT token_id,
       (select symbol from eth.public.tokens t where t.id = token_id),
       sum(cast(liquidity_usd as decimal(38, 10))) as liquidity
FROM agg.chain_eth.token_liquidities
WHERE against_id in (token('0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2', 'eth'),
                     token('0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48', 'eth'),
                     token('0xdAC17F958D2ee523a2206206994597C13D831ec7', 'eth'))
group by token_id
order by liquidity desc
limit 10;