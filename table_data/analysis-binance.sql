-- All important analysis for tokens filtered by given conditions on different indicators
SELECT pairs.symbol, a.*, tfa.*, a.volume24_h * a.price as volume_dollars
FROM screener.analyses a
         join screener.time_frame_analyses tfa
              on (a.token_id = tfa.token_id and a.exchange = 'binance' and tfa.exchange = 'binance')
         join binance.pairs pairs on (a.token_id = pairs.id)
WHERE timeframe = 'M1'
  and sma20 > sma100
  and par_sar < a.price
ORDER BY volume_dollars DESC;