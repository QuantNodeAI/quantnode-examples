-- Get all Platforms on the chain sorted by available liquidity of all tokens

SELECT (select name from bsc.public.platforms p where p.id = token_liquidities.platform_id) as platform,
       sum(liquidity_usd) as liquidity
FROM bsc.public.token_liquidities
GROUP BY platform_id
ORDER BY liquidity DESC
limit 10;