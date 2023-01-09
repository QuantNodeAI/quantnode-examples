-- Get Kucoin pairs sorted by traded volume on the Kucoin Exchange

SELECT (select symbol from kucoin.pairs p where p.id = token_id) as pair,
       price,
       price_change1_d,
       cast(volume24_h as decimal(38, 9)) * cast(price as decimal(38, 9)) as volume_usd
FROM screener.screener.analyses
WHERE exchange = 'kucoin'
ORDER BY volume_usd desc
LIMIT 100;