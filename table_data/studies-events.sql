-- Get list of upcoming events
-- supported event_type values: ico, ipo, event, listing, airdrop, other

SELECT *
FROM studies.helixir.events
WHERE event_type = 'listing'
  and date_time >= now()
ORDER BY date_time
limit 5;