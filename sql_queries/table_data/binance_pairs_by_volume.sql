-- Get Binance pairs sorted by traded volume on the Binance Exchange

SELECT (select symbol from cex.binance.pairs p where p.id = token_id),
       price,
       price_change_1d,
       volume_24h * price as volume_usd
FROM screener.screener.analyses
WHERE exchange = 'binance'
ORDER BY volume_usd desc
LIMIT 100;