-- Get top tokens with the highest rise in price over 1 day period

SELECT CASE
           WHEN chain = 56 THEN
                   (select symbol from chain_bsc.tokens t where t.id = analyses.token_id)
           WHEN chain = 1 THEN
                   (select symbol from chain_eth.tokens t where t.id = analyses.token_id)
           WHEN chain = 137 THEN
               (select symbol from chain_matic.tokens t where t.id = analyses.token_id)
           WHEN chain = 43114 THEN
               (select symbol from chain_avax.tokens t where t.id = analyses.token_id)
           WHEN chain = 250 THEN
                   (select symbol from chain_ftm.tokens t where t.id = analyses.token_id)
           END symbol,
       updated_at,
       chain,
       created,
       price,
       price_change1_h,
       price_change1_d,
       volume24_h,
       market_cap
FROM screener.analyses
WHERE updated_at >= now() - interval '1 hour'
  and exchange = 'Defi'
ORDER BY price_change1_d DESC
LIMIT 10;
