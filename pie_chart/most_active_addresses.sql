-- Get the most active addresses by mean of number of transaction for given time interval

select (select address from chain_bsc.addresses a where a.id = from_id) as address, count(id) as count
from bsc.public.transactions
where confirmed_at >= timestamp '2023-01-05 12:00:00'
  and confirmed_at <= timestamp '2023-01-05 16:00:00'
group by from_id
order by count desc
limit 100;