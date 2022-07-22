-- Get top token by its swapped volume in the last 24 hours on the PancakeSwap platform
-- Unfortunately there are some scam tokens as well

select v.token_id, (select t.symbol from chain_bsc.tokens t where t.id = v.token_id),
       sum(cast(volume as numeric))                as volume,
       avg(a.price)                                as price,
       sum(cast(volume as numeric)) * avg(a.price) as usd_volume
from chain_bsc.volume_ticks_hourly v
         join screener.analyses a on (chain = 56 and a.token_id = v.token_id)
where bucket >= now() - interval '24 hours'
  and platform_id = 1
group by v.token_id
order by usd_volume desc
limit 100;