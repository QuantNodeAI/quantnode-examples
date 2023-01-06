-- Recent balances of the given wallet
SELECT COALESCE(t.symbol, 'ETH') as token, balance
from agg.chain_eth.balances b
         left join chain_eth.tokens t on (b.token = t.id)
where wallet = wallet('0x90eB678C3586103805a676d21721Cc6883a6c3AE', eth);