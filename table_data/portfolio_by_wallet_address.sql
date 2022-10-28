-- Recent balances of the given wallet
SELECT COALESCE(t.symbol, 'ETH') as token, balance
from chain_eth.balances b
         left join chain_eth.tokens t on (b.token = t.id)
         join chain_eth.addresses a on (b.wallet = a.id)
where a.address = '0x90eB678C3586103805a676d21721Cc6883a6c3AE';