-- Get token flow on the given wallet for last 5 days

SELECT time_bucket('1 hour', bucket) as time,
       SUM(case
               when cast(move as numeric) < 0 then cast(move as numeric)
               else 0 END)           as out_amount,
       SUM(case
               when cast(move as numeric) > 0 then cast(move as numeric)
               else 0 END)           as in_amount,
       SUM(cast(move as numeric))    as net_amount
FROM chain_bsc.balance_move_ticks_minutely
WHERE bucket > now() - interval '5 days'
  and wallet_id = ANY
      (ARRAY(SELECT id from chain_bsc.addresses where address = '0xA1C6B6778A5aECCfBa77ca9472C7cfd26f2643c0'))
  and token_id = ANY
      (ARRAY(SELECT id from chain_bsc.tokens where contract = '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c'))
group by 1
order by 1;