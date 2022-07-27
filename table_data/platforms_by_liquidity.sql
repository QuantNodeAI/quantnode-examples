-- Get all Platforms on the chain sorted by available liquidity of all tokens

SELECT (select name from chain_bsc.platforms p where p.id = token_liquidities.platform_id) as platform,
       sum(liquidity_usd) as liquidity
FROM chain_bsc.token_liquidities
GROUP BY platform_id
ORDER BY liquidity DESC
limit 10;