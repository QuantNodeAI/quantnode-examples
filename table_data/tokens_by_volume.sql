-- Get top token by its swapped volume in the last 24 hours on the PancakeSwap platform
-- Unfortunately there are some scam tokens as well

select v.token_id, (select t.symbol from bsc.public.tokens t where t.id = v.token_id),
       sum(cast(volume as decimal(38, 5)))                as volume,
       avg(cast(a.price as decimal(38, 18)))                                as price,
       sum(cast(volume as decimal(38,5))) * avg(cast(a.price as decimal(38, 9))) as usd_volume
from agg.chain_bsc.volume_ticks_hourly v
         join agg.screener.analyses a on (chain = 56 and a.token_id = v.token_id)
where bucket >= now() - interval '24' hour
  and platform_id = 1
group by v.token_id
order by usd_volume desc
limit 100;