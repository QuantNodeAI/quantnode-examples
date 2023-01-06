-- Get transactions for given address
-- CAUTION: DO NOT use 'order by' yet (it is extremely slowing query down)

SELECT confirmed_at,
       block,
       tx_hash,
       (select address from bsc.public.addresses where id = transactions.from_id) as from_address,
       (select address from bsc.public.addresses where id = transactions.to_id)   as to_address,
       value,
       tx_fee
from bsc.public.transactions
WHERE confirmed_at >= timestamp '2022-07-01'
  and confirmed_at <= timestamp '2022-07-23'
  and (from_id = wallet('0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6')
    or to_id = wallet('0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6'))
order by confirmed_at
limit 10;