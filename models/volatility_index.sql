-- models/volatility_index.sql

WITH daily_returns AS (
  SELECT
    coin_id,
    snapshot_date,
    price_usd,
    LAG(price_usd) OVER (PARTITION BY coin_id ORDER BY snapshot_date) AS prev_price
  FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY coin_id, snapshot_date ORDER BY last_updated DESC) AS rn
    FROM {{ ref('cleaned_crypto') }}
  )
  WHERE rn = 1
)
SELECT
  coin_id,
  STDDEV(LN(price_usd / prev_price)) AS volatility_index
FROM daily_returns
WHERE prev_price IS NOT NULL
GROUP BY coin_id