-- Get filtered token by some technical indicators with its indicators and patterns as well
WITH analysis AS (SELECT cast(a.market_cap as decimal(38, 10)) as market_cap, tfa.*
                  FROM agg.screener.analyses a
                           join agg.screener.time_frame_analyses tfa on a.token_id = tfa.token_id
                  WHERE timeframe = 'H1'
                    and cast(market_cap as decimal(38, 10)) > 20000000
                    and sma20 > sma100
                    and cast(rsi as decimal(38, 10)) < 50
                    and a.chain = 1
                  ORDER BY market_cap DESC
    LIMIT 10)
SELECT symbol, analysis.*
FROM eth.public.tokens,
     analysis
WHERE tokens.id = analysis.token_id;