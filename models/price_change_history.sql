-- models/price_change_history.sql

WITH latest_per_day AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY coin_id, snapshot_date ORDER BY last_updated DESC) AS rn
  FROM {{ ref('cleaned_crypto') }}
)

SELECT coin_id, snapshot_date, price_usd, price_change_24h
FROM latest_per_day
WHERE rn = 1
ORDER BY snapshot_date DESC
