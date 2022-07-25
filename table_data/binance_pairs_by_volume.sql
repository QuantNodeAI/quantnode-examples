-- Get Binance pairs sorted by traded volume on the Binance Exchange

SELECT (select symbol from binance.pairs p where p.id = token_id),
       price,
       price_change1_d,
       volume24_h*price as volume_usd
FROM screener.analyses
WHERE exchange = 'binance'
ORDER BY volume_usd desc
LIMIT 100;