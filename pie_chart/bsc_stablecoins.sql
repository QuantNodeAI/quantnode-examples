-- Get the biggest stable coins on the BSC Chain

SELECT (select symbol from bsc.public.tokens where id = t.token_id) as token, t.market_cap
FROM agg.screener.analyses t
WHERE token_id in (token('0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56'),
                   token('0x55d398326f99059fF775485246999027B3197955'),
                   token('0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d'),
                   token('0x1AF3F329e8BE154074D8769D1FFa4eE058B1DBc3'),
                   token('0x14016E85a25aeb13065688cAFB43044C2ef86784'))
  and chain = 56
ORDER BY market_cap DESC;