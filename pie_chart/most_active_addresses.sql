-- Get the most active addresses by mean of number of transaction for given time interval

select (select address from chain_bsc.addresses a where a.id = from_id), count(id) as count
from chain_bsc.transactions
where confirmed_at >= '2022-07-22 12:00:00'
  and confirmed_at <= '2022-07-22 16:00:00'
group by from_id
order by count desc
limit 100;