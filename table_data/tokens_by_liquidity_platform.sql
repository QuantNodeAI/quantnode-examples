-- Get tokens by its liquidity against the biggest tokens (WBNB, BUSD, CAKE, USDT, USDC) on BSC
-- liquidity is separated by platforms as well

SELECT token_id,
       (select symbol from bsc.public.tokens t where t.id = token_id),
       (select name from bsc.public.platforms p where p.id = token_liquidities.platform_id) as platform,
       sum(liquidity_usd) as liquidity
FROM bsc.public.token_liquidities
WHERE against_id in (token('0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c'),
                     token('0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56'),
                     token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'),
                     token('0x55d398326f99059fF775485246999027B3197955'),
                     token('0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d'))
group by token_id, platform_id
order by liquidity desc
limit 10;