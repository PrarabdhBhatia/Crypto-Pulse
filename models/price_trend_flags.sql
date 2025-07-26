-- models/price_trend_flags.sql

WITH latest AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY coin_id, snapshot_date ORDER BY last_updated DESC) AS rn
  FROM {{ ref('cleaned_crypto') }}
)
SELECT
  coin_id,
  snapshot_date,
  price_usd,
  price_change_24h,
  CASE 
    WHEN price_change_24h > 0 THEN 'rising'
    WHEN price_change_24h < 0 THEN 'falling'
    ELSE 'stable'
  END AS trend
FROM latest
WHERE rn = 1
