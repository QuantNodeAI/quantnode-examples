-- Get Bitfinex pairs sorted by traded volume on the Bitfinex Exchange

SELECT (select symbol from agg.bitfinex.pairs p where p.id = token_id),
       price,
       price_change1_d,
       cast(volume24_h as decimal(38, 9)) * cast(price as decimal(38, 9)) as volume_usd
FROM agg.screener.analyses
WHERE exchange = 'bitfinex'
ORDER BY volume_usd desc
LIMIT 100;
