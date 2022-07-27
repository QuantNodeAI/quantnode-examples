-- Get tokens by its liquidity against the biggest tokens (WBNB, BUSD, CAKE, USDT, USDC) on BSC
-- liquidity is separated by platforms as well

SELECT token_id,
       (select symbol from chain_bsc.tokens t where t.id = token_id),
       (select name from chain_bsc.platforms p where p.id = token_liquidities.platform_id) as platform,
       sum(liquidity_usd) as liquidity
FROM chain_bsc.token_liquidities
WHERE against_id in (10, 2, 23, 6, 9)
group by token_id, platform_id
order by liquidity desc
limit 10;