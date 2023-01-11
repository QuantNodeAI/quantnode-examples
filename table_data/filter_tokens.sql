-- Get filtered token by some technical indicators with its indicators and patterns as well
SELECT *,
       *symbol('token_id', 'eth', 'tokens')
FROM screener.screener.indicators
WHERE timeframe = 'H1'
  and market_cap > '20000000'
  and sma20 > sma100
  and rsi < '50'
  and chain = 1
ORDER BY market_cap DESC
LIMIT 10;