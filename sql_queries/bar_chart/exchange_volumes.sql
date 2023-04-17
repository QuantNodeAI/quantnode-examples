-- Get traded volumes in last 24 hours for individual exchanges

SELECT exchange, sum(volume_24h*price) as volume
FROM screener.screener.analyses
WHERE exchange in ('binance', 'kucoin', 'bitfinex', 'coinbase')
group by exchange
order by volume desc;