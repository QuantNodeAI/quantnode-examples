-- Retrieve swaps for given address

SELECT created_at,
       block,
       (select address from chain_bsc.addresses where id = log_swaps.sender_id) as from_address,
       (select address from chain_bsc.addresses where id = log_swaps.to_id) as to_address,
       (select symbol from chain_bsc.tokens where id = log_swaps.token0_id) as token0,
       (select symbol from chain_bsc.tokens where id = log_swaps.token1_id) as token1,
       amount0_in, amount0_out, amount1_in, amount1_out
FROM chain_bsc.log_swaps
WHERE created_at >= '2022-07-01'
  and created_at <= '2022-07-23'
  and (sender_id = ANY (ARRAY(SELECT id FROM chain_bsc.addresses where address = '0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6')) or
        to_id = ANY (ARRAY (SELECT id FROM chain_bsc.addresses where address = '0xbaC14A55Da4327f79D69AF657AD6837aA49c9aC6')))
limit 10;