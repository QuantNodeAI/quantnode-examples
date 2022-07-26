-- Get top tokens with the highest rise in price over 1 day period

SELECT CASE
           WHEN exchange = 'binance' THEN
                   (select symbol from binance.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'kucoin' THEN
                   (select symbol from kucoin.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'bitfinex' THEN
                   (select symbol from bitfinex.pairs t where t.id = analyses.token_id)
           END symbol,
       updated_at,
       exchange,
       created,
       price,
       price_change1_h,
       price_change1_d,
       volume24_h,
       market_cap
FROM screener.analyses
WHERE updated_at >= now() - interval '1 hour'
  and chain = 0
ORDER BY price_change1_d DESC
LIMIT 10;