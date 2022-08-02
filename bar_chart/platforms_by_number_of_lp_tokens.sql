-- Get platforms on given Chain ordered by number of available LP Tokens

SELECT name, count(id) as token_number
FROM chain_bsc.lp_tokens
GROUP BY name
ORDER BY token_number desc
LIMIT 20;