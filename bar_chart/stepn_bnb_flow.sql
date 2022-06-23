SELECT date_trunc('day', confirmed_at)           AS block_date,
       SUM(CASE
               WHEN to_id = 61285418 THEN cast(value as numeric)
               ELSE 0 END)                       AS in_amt,
       SUM(CASE
               WHEN from_id = 61285418 THEN cast(value as numeric)
               ELSE 0 END)                       AS out_amt,
       SUM(CASE
               WHEN to_id = 61285418 THEN cast(value as numeric)
               ELSE -cast(value as numeric) END) AS net_amt
FROM chain_bsc.transactions
WHERE confirmed_at > (CURRENT_DATE - '91 days'::INTERVAL)
  AND (to_id = 61285418 OR from_id = 61285418)
GROUP BY block_date
ORDER BY block_date
LIMIT 90;