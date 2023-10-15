{{ config(materialized="table") }}

SELECT
    ORDER_ID,
    ORDER_ITEM_ID,
    PRODUCT_ID,
    SELLER_ID,
    SHIPPING_LIMIT_DATE,
    PRICE,
    FREIGHT_VALUE
FROM {{ source('flachavanne_ecommerce_raw2', 'order_items') }}