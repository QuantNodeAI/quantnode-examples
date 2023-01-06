-- Get token flow on the given wallet for given time interval

SELECT bucket                as time,
       cast(move as decimal) as net_amount
FROM agg.chain_bsc.balance_move_ticks_minutely
WHERE bucket >= timestamp '2023-01-01'
  and bucket <= timestamp '2023-01-03'
  and wallet_id = wallet('0xF977814e90dA44bFA03b6295A0616a897441aceC', 56)
  and token_id = token('0x71e72DdE4152D274afD1F2DB43531Ed9E44A78Fa', 'bsc')
order by 1;