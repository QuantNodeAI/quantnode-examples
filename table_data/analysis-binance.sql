-- All important analysis for tokens filtered by given conditions on different indicators
SELECT pairs.symbol, a.*, tfa.*, cast(a.volume24_h as decimal(38, 9)) * cast(a.price as decimal(38, 9)) as volume_dollars
FROM screener.screener.analyses a
         join screener.screener.time_frame_analyses tfa
              on (a.token_id = tfa.token_id and a.exchange = 'binance' and tfa.exchange = 'binance')
         join cex.binance.pairs pairs on (a.token_id = pairs.id)
WHERE timeframe = 'M1'
  and sma20 > sma100
  and par_sar < a.price
ORDER BY volume_dollars DESC;