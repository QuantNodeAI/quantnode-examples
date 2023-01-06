-- Get price changes for given token by its contract

SELECT price_change1_h, price_change4_h, price_change1_d, price_change7_d, price_change1_mn
FROM agg.screener.analyses
where chain = 56
  and token_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82');