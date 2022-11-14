-- Get github stats for github repositories of given token

WITH asset AS (SELECT id, coingecko_name from publications.assets WHERE symbol = 'eth'),
     repo AS (SELECT gr.*
              FROM publications.github_repositories gr,
                   asset
              WHERE gr.asset_id = asset.id)
SELECT time,
       repository_id,
       repo.repo,
       forks,
       subscribers,
       contributions,
       open_issues,
       open_prs,
       closed_issues,
       closed_prs
from publications.github_stats,
     repo
where repository_id = repo.id
  and time >= '2022-11-05'
  and time <= '2022-11-15';