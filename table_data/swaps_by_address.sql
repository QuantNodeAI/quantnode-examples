-- Retrieve swaps for given address

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
  and (sender_id = wallet('0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6') or
       to_id = wallet('0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6'))
limit 10;