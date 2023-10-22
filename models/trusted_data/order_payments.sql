{{ config(materialized="table") }}

SELECT
    ORDER_ID,
    PAYMENT_SEQUENTIAL,
    PAYMENT_TYPE,
    PAYMENT_INSTALLMENTS,
    COALESCE(PAYMENT_VALUE, 0) as PAYMENT_VALUE,
FROM {{ source('flachavanne_ecommerce_raw2', 'order_payments') }}
where ORDER_ID is not null and PAYMENT_INSTALLMENTS != 0 and PAYMENT_SEQUENTIAL is not null