-- Get top tokens with the highest rise in price over 1 day period

SELECT CASE
           WHEN exchange = 'binance' THEN
               (select symbol from cex.binance.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'kucoin' THEN
               (select symbol from cex.kucoin.pairs t where t.id = analyses.token_id)
           WHEN exchange = 'bitfinex' THEN
               (select symbol from cex.bitfinex.pairs t where t.id = analyses.token_id)
           END symbol,
       updated_at,
       exchange,
       created,
       price,
       price_change_1h,
       price_change_1d,
       volume_24h,
       market_cap
FROM screener.screener.analyses
WHERE updated_at >= now() - interval '1' hour
ORDER BY price_change_1d
LIMIT 10;