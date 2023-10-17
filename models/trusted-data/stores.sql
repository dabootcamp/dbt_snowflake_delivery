{{ config(materialized="table") }}

select
    store_id,
    hub_id,
    UPPER(TRIM(store_name)) AS store_name,
    UPPER(TRIM(store_segment)) AS store_segment,
    COALESCE(store_plan_price, 0) AS store_plan_price,
    store_latitude,
    store_longitude
from {{ source('delivery_raw', 'stores') }}
