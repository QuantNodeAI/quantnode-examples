-- Get total number of active tokens

SELECT count(id)
from chain_bsc.tokens
where active = true;