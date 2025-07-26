WITH latest_per_coin AS (
  SELECT *,
         ROW_NUMBER() OVER (
             PARTITION BY coin_id, snapshot_date 
             ORDER BY last_updated DESC
         ) AS rn
  FROM {{ ref('cleaned_crypto') }}
  WHERE DATE(snapshot_date) = CURRENT_DATE()
)
-- rest of query same...
SELECT 
  coin_id,
  symbol,
  price_usd,
  market_cap_usd,
  percent_change_24h,
  volume_24h,
  price_change_24h,
  high_24h,
  low_24h,
  ath,
  atl,
  circulating_supply,
  total_supply,
  max_supply,
  last_updated,
  snapshot_date,
  ROW_NUMBER() OVER (ORDER BY percent_change_24h DESC) AS top_gainer_rank,
  ROW_NUMBER() OVER (ORDER BY percent_change_24h ASC) AS top_loser_rank
FROM latest_per_coin
WHERE rn = 1