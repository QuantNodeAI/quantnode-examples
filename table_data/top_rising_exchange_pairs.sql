-- Get top tokens with the highest rise in price over 1 day period

SELECT CASE
           WHEN exchange = 'binance' THEN
               (select symbol from agg.binance.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'kucoin' THEN
               (select symbol from agg.kucoin.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'bitfinex' THEN
               (select symbol from agg.bitfinex.pairs t where t.id = analyses.token_id)
           END symbol,
       updated_at,
       exchange,
       created,
       price,
       price_change1_h,
       cast(price_change1_d as decimal(38, 18)) as price_change1_d,
       volume24_h,
       market_cap
FROM agg.screener.analyses
WHERE updated_at >= now() - interval '1' hour
  and chain = 0
ORDER BY price_change1_d DESC
LIMIT 10;