-- Get number of holders of given token that has balance more than 0 (can be changed)
SELECT count(*)
from chain_eth.balances b
         join chain_eth.tokens t on (b.token = t.id)
where t.contract = '0x6B3595068778DD592e39A122f4f5a5cF09C90fE2'
  and cast(balance as numeric) > 0;