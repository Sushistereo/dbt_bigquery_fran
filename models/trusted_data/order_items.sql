{{ config(materialized="table") }}

SELECT
    ORDER_ID,
    ORDER_ITEM_ID,
    PRODUCT_ID,
    SELLER_ID,
    SHIPPING_LIMIT_DATE,
    COALESCE(PRICE, 0) as PRICE,
    COALESCE(FREIGHT_VALUE, 0) as FREIGHT_VALUE
FROM {{ source('flachavanne_ecommerce_raw2', 'order_items') }}
WHERE ORDER_ID IS NOT NULL