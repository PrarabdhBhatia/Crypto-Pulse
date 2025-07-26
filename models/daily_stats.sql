SELECT
  snapshot_date,
  coin_id,
  symbol,
  AVG(price_usd) AS avg_price_usd,
  SUM(volume_24h) AS total_volume_24h,
  MAX(high_24h) AS max_high_24h,
  MIN(low_24h) AS min_low_24h
FROM {{ ref('cleaned_crypto') }}
GROUP BY snapshot_date, coin_id, symbol
