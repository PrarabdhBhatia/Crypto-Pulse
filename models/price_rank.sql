-- models/price_rank.sql

WITH latest_per_coin AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY coin_id, snapshot_date ORDER BY last_updated DESC) AS rn
  FROM {{ ref('cleaned_crypto') }}
  WHERE DATE(snapshot_date) = CURRENT_DATE()
)
SELECT coin_id, symbol, market_cap_usd, snapshot_date
FROM latest_per_coin
WHERE rn = 1
ORDER BY market_cap_usd DESC
