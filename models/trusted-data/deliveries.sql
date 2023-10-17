{{ config(materialized="table") }}

SELECT
    delivery_id
  , delivery_order_id
  , driver_id::INTEGER AS driver_id
  , COALESCE(delivery_distance_meters, 0) delivery_distance_meters
  , TRIM(UPPER(delivery_status)) AS delivery_status
FROM {{ source('delivery_raw', 'deliveries') }}
WHERE delivery_order_id IS NOT NULL
    AND driver_id IS NOT NULL