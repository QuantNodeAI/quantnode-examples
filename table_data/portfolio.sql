-- Recent balances of the given wallet by its ID
-- if you do not know id of wallet, find it in the chain_eth.addresses table or use another example:
-- see portfolio_by_wallet_address.sql, but unfortunately it is much slower
SELECT COALESCE(t.symbol, 'ETH') as token, balance
from chain_eth.balances b
         left join chain_eth.tokens t on (b.token = t.id)
where wallet = 66459424;