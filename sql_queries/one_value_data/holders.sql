-- Get number of holders of given token that has balance more than 0 (can be changed)
SELECT count(*) as holders
from series.chain_eth.balances
where token = token('0x6B3595068778DD592e39A122f4f5a5cF09C90fE2', 1)
  and cast(balance as decimal(38, 18)) > 0;