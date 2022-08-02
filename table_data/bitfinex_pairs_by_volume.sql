-- Get Bitfinex pairs sorted by traded volume on the Bitfinex Exchange

SELECT (select symbol from bitfinex.pairs p where p.id = token_id),
       price,
       price_change1_d,
       volume24_h*price as volume_usd
FROM screener.analyses
WHERE exchange = 'bitfinex'
ORDER BY volume_usd desc
LIMIT 100;
