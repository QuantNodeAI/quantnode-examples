-- Get most recent topics from publications

WITH latest_timestamp AS (SELECT timestamp
                          FROM studies.helixir.topics
                          ORDER BY timestamp desc
                          limit 1)
SELECT t.timestamp, topic, keywords, top_articles
FROM studies.helixir.topics t, latest_timestamp
WHERE t.timestamp = latest_timestamp.timestamp;