-- Get number of swaps for given token by its ID for last 5 days
-- if you do not know id of token, find it in the chain_bsc.tokens table

select bucket, sum(count) as count
from series.chain_bsc.swap_number_ticks_hourly
where bucket >= now() - interval '5' day
  and (token0_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82') or token1_id = token('0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'))
group by 1
order by 1;