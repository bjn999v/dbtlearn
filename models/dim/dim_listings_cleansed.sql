{{ config(materialized='table') }}
WITH src_listings AS (
    select * from {{ref("src_listings")}}
)
SELECT 
listing_id,
listing_name,
room_type,
case
when minimum_nights=0 then 1
else minimum_nights
end as minimum_nights,
host_id,
REPLACE(price_str,'$')::NUMBER(10,2) AS price,
created_at,
updated_at
from src_listings