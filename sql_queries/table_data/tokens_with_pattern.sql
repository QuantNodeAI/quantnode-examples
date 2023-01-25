-- Get all tokens with specific candle pattern in current data
-- this example is looking for tokens with 'Morning Doji Star' pattern
-- value in pattern column means number of candles after pattern occurred (0 - most recent candle is last candle of the pattern)

SELECT (SELECT t.symbol FROM chain_bsc.tokens t WHERE t.id = tf.token_id), timeframe, exchange, chain, sma20, morning_doji_star
FROM screener.screener.time_frame_analyses tf
WHERE morning_doji_star >= 0;