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
  TIMESTAMP_TRUNC(last_updated, DAY) AS snapshot_date
FROM
  `n8nauth-465703.crypto_dataset.prices`
WHERE
  price_usd IS NOT NULL
