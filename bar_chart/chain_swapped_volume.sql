-- Get swapped volume in the last 24 hours for individual chains

SELECT chain, sum(volume24_h*price) as volume
FROM screener.analyses
WHERE chain in (1, 56, 137, 250, 43114)
GROUP BY chain
ORDER BY volume desc;
