-- Get Kucoin pairs sorted by traded volume on the Kucoin Exchange

SELECT (select symbol from kucoin.pairs p where p.id = token_id),
       price,
       price_change1_d,
       volume24_h*price as volume_usd
FROM screener.analyses
WHERE exchange = 'kucoin'
ORDER BY volume_usd desc
LIMIT 100;