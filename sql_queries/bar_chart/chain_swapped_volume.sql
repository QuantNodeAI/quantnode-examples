-- Get swapped volume in the last 24 hours for individual chains

SELECT chain, sum(cast(volume24_h as decimal(38, 10))*cast(price as decimal(38, 10))) as volume
FROM screener.screener.analyses
WHERE chain in (137, 250, 43114) and price > '0'
GROUP BY chain
ORDER BY volume desc;
