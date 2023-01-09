-- Basic information and analysis for given token and chain/exchange by its id

SELECT *
FROM screener.screener.analyses
WHERE token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82')
  and chain = 56;