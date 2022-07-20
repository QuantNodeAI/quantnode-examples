-- Get number of swaps for given token by its ID for last 5 days
-- if you do not know id of token, find it in the chain_bsc.tokens table

select bucket, sum(count) as count
from chain_bsc.swap_number_ticks_hourly
where bucket >= now() - interval '5 days'
  and (token0_id = 23 or token1_id = 23)
group by 1
order by 1;