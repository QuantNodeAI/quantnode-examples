-- Get most active tokens by means of most active unique addresses with any movement in last 24 hours

SELECT token_id,
       (select t.symbol from chain_bsc.tokens t where t.id = token_id),
       count(distinct wallet_id) as unique_wallets
FROM chain_bsc.balance_move_ticks_hourly
WHERE bucket > now() - interval '24 hours'
GROUP BY token_id
ORDER BY unique_wallets desc
limit 100;