-- Get all technical indicators and candle patterns for given token and chain given by its ID

SELECT *
FROM agg.screener.time_frame_analyses
WHERE token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
  and chain = 56;