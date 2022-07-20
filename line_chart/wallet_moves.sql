-- Get all moves for given wallet by its ID grouped by tokens
-- if you do not know id of wallet, find it in the chain_bsc.addresses table or use this where cond:
-- wallet_id = ANY
--     (ARRAY(select id from chain_bsc.addresses where address = '0x888888888760BC907e2ea610b96897303cd22494'))
-- instead of:
-- wallet_id = 53218971

SELECT bucket, (select t.symbol from chain_bsc.tokens t where t.id = token_id), sum(cast(move as numeric))
FROM chain_bsc.balance_move_ticks_hourly
WHERE bucket >= now() - interval '5 days'
  and wallet_id = 53218971
group by token_id, bucket
order by 1;