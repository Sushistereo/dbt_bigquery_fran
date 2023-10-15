{{ config(materialized="table") }}

SELECT
    SELLER_ID,
    SELLER_ZIP_CODE_PREFIX,
    SELLER_CITY,
    SELLER_STATE,
FROM {{ source('flachavanne_ecommerce_raw2', 'sellers') }}
WHERE SELLER_ID IS NOT NULL