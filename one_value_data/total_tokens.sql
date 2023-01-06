-- Get total number of all tokens on the chain (included inactive ones)

SELECT count(id) as count
from bsc.public.tokens;