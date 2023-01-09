-- Get traded volumes in last 24 hours for individual exchanges

SELECT exchange, sum(cast(volume24_h as decimal(38, 10))*cast(price as decimal(38, 10))) as volume
FROM screener.screener.analyses
WHERE exchange in ('binance', 'kucoin', 'bitfinex')
GROUP BY exchange
ORDER BY volume desc;