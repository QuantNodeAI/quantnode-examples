-- Get the biggest stable coins on the BSC Chain

SELECT (select symbol from chain_bsc.tokens where id = t.token_id), t.market_cap
FROM screener.analyses t
WHERE token_id in (2, 6, 9, 549, 2084)
  and chain = 56
ORDER BY market_cap DESC;