-- models/coin_summary_stats.sql

SELECT
  coin_id,
  symbol,
  COUNT(DISTINCT snapshot_date) AS days_tracked,
  AVG(price_usd) AS avg_price,
  MAX(price_usd) AS max_price,
  MIN(price_usd) AS min_price,
  AVG(percent_change_24h) AS avg_daily_change
FROM {{ ref('cleaned_crypto') }}
GROUP BY coin_id, symbol
ORDER BY avg_price DESC
