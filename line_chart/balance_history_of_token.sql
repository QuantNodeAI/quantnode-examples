-- get historic balance of token on given wallet for last 7 days with current balance
-- (best line and bar chart combined)

WITH token AS (SELECT id, symbol FROM chain_bsc.tokens WHERE contract = '0x3A68A9Cd188C324a45c06866eFD1C79605B66827'),
     wallet AS (SELECT id, address
                FROM chain_bsc.addresses
                WHERE address = '0x5658f59D94249A3113153Daa7ED11E67AAf3E018'),
     curr_balance AS (SELECT balance
                      from chain_bsc.balances,
                           token,
                           wallet
                      where token = token.id
                        and wallet = wallet.id),
     data as (SELECT time_bucket('1 hour', bucket) as time,
                     SUM(cast(move as numeric))    as net_amount
              FROM chain_bsc.balance_move_ticks_hourly,
                   token,
                   wallet
              WHERE bucket >= now() - interval '7 days'
                and bucket <= now()
                and wallet_id = wallet.id
                and token_id = token.id
              group by 1
              order by 1)
select time,
       net_amount,
       cast(curr_balance.balance as numeric) +
       sum(-net_amount) over (order by time desc rows between unbounded preceding and current row ) as balance,
       curr_balance.balance                                                                         as current_balance
from data,
     curr_balance
order by time;