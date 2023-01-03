-- Get token flow on the given wallet for given time interval

WITH token AS (SELECT id, symbol
               FROM bsc.public.tokens
               WHERE contract = '0x71e72DdE4152D274afD1F2DB43531Ed9E44A78Fa'),
     address AS (SELECT id
                 FROM bsc.public.addresses
                 WHERE address = '0xF977814e90dA44bFA03b6295A0616a897441aceC')
SELECT bucket                as time,
       cast(move as decimal) as net_amount
FROM agg.chain_bsc.balance_move_ticks_minutely,
     token,
     address
WHERE bucket >= timestamp '2023-01-01'
  and bucket <= timestamp '2023-01-03'
  and wallet_id = address.id
  and token_id = token.id
order by 1;