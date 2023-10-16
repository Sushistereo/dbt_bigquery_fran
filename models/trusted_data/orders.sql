{{ config(materialized="table") }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    UPPER(TRIM(order_status)) AS ORDER_STATUS,
    ORDER_PURCHASE_TIMESTAMP,
    ORDER_APPROVED_AT,
    ORDER_DELIVERED_CARRIER_DATE,
    ORDER_DELIVERED_CUSTOMER_DATE,
    ORDER_ESTIMATED_DELIVERY_DATE
FROM {{ source('flachavanne_ecommerce_raw2', 'orders') }}
where ORDER_ID is not null AND
CUSTOMER_ID is not null