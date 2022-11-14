-- Get github repositories for token
WITH asset AS (SELECT id, coingecko_name, rank from publications.assets WHERE symbol = 'avax')
SELECT gr.owner, gr.repo, gr.created_at, asset.coingecko_name as asset_name, asset.rank as asset_rank
FROM publications.github_repositories gr,
     asset
WHERE asset_id = asset.id;