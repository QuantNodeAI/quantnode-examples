-- Get filtered token by some technical indicators with its indicators and patterns as well
SELECT (select t.symbol from chain_bsc.tokens t where t.id = a.token_id), a.*, tfa.*
FROM screener.analyses a
         join screener.time_frame_analyses tfa on a.token_id = tfa.token_id
WHERE timeframe = 'H1'
  and market_cap > 20000000
  and sma20 > sma100
  and rsi < 50
  and a.chain = 56
ORDER BY market_cap DESC
LIMIT 10;