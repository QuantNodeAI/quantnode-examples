-- Get total number of active tokens

SELECT count(id) as active_tokens
from bsc.public.tokens
where active = true;