-- Retrieve swaps for given lp_token
-- id of lp_token is retrieved from wallet() function because of fact that LP Token contract is actually saved to
-- the address field of Swap Object

SELECT created_at,
       block,
--        (select address from bsc.public.addresses where id = log_swaps.sender_id) as from_address,    -- labeling which is very slow at the moment
--        (select address from bsc.public.addresses where id = log_swaps.to_id)     as to_address,      -- labeling which is very slow at the moment
--        (select symbol from bsc.public.tokens where id = log_swaps.token0_id)     as token0,          -- labeling which is very slow at the moment
--        (select symbol from bsc.public.tokens where id = log_swaps.token1_id)     as token1,          -- labeling which is very slow at the moment
       sender_id,
       to_id,
       token0_id,
       token1_id,
       amount0_in, amount0_out, amount1_in, amount1_out
FROM bsc.public.log_swaps
WHERE created_at >= timestamp '2022-07-01'
  and created_at <= timestamp '2022-07-23'
  and address_id = wallet('0x0eD7e52944161450477ee417DE9Cd3a859b14fD0')
order by created_at
limit 10;
