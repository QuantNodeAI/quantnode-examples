-- Get traded volumes in last 24 hours for individual exchanges

SELECT exchange, sum(volume24_h*price) as volume
FROM screener.analyses
WHERE exchange in ('binance', 'kucoin', 'bitfinex')
group by exchange
order by volume desc;