-- get historic balance of token on given wallet for last 7 days with current balance
-- (best line and bar chart combined)

WITH curr_balance AS (SELECT balance
                      from agg.chain_bsc.balances
                      where token = token('0x3A68A9Cd188C324a45c06866eFD1C79605B66827', 56)
                        and wallet = wallet('0x5658f59D94249A3113153Daa7ED11E67AAf3E018', 56)),
     data as (SELECT bucket as time,
                     cast(move as decimal(38, 18))  as net_amount
              FROM agg.chain_bsc.balance_move_ticks_hourly
              WHERE bucket >= now() - interval '7' day
                and bucket <= now()
                and wallet_id = wallet('0x5658f59D94249A3113153Daa7ED11E67AAf3E018', 56)
                and token_id = token('0x3A68A9Cd188C324a45c06866eFD1C79605B66827', 56)
              order by 1)
select time,
       net_amount,
       cast(curr_balance.balance as decimal(38, 18)) +
       coalesce(sum(-net_amount) over (order by time desc rows between unbounded preceding and 1 preceding),
                0)          as balance,
       curr_balance.balance as current_balance
from data,
     curr_balance
order by time;