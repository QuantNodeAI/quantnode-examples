-- Flow of BNB token on the BSC Chain through StepN game (see https://stepn.com/)
-- In case you want to see flow through some other wallet, find wallet_id in the chain_bsc.addresses table
SELECT date_trunc('day', confirmed_at)           AS block_date,
       SUM(CASE
               WHEN to_id = 61285418 THEN cast(value as decimal)
               ELSE 0 END)                       AS in_amt,
       SUM(CASE
               WHEN from_id = 61285418 THEN cast(value as decimal)
               ELSE 0 END)                       AS out_amt,
       SUM(CASE
               WHEN to_id = 61285418 THEN cast(value as decimal)
               ELSE -cast(value as decimal) END) AS net_amt
FROM bsc.public.transactions
WHERE confirmed_at > (now() - interval '91' day)
  AND (to_id = 61285418 OR from_id = 61285418)
GROUP BY 1
ORDER BY 1
LIMIT 90;