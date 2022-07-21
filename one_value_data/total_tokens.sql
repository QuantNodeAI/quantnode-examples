-- Get total number of all tokens on the chain (included inactive ones)

SELECT count(id)
from chain_bsc.tokens;