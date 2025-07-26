SELECT
  snapshot_date,
  COUNT(DISTINCT coin_id) AS total_coins,
  AVG(price_usd) AS avg_price,
  AVG(volume_24h) AS avg_volume,
  SUM(market_cap_usd) AS total_market_cap
FROM {{ ref('cleaned_crypto') }}
GROUP BY snapshot_date
ORDER BY snapshot_date DESC