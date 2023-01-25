-- Get Binance pairs sorted by traded volume on the Binance Exchange

SELECT (select symbol from cex.binance.pairs p where p.id = token_id),
       price,
       price_change1_d,
       cast(volume24_h as decimal(38, 9)) * cast(price as decimal(38, 9)) as volume_usd
FROM screener.screener.analyses
WHERE exchange = 'binance'
ORDER BY volume_usd desc
LIMIT 100;