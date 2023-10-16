{{ config(materialized="table") }}

SELECT
    PRODUCT_ID,
    COALESCE(PRODUCT_CATEGORY_NAME, "") as PRODUCT_CATEGORY_NAME,
    PRODUCT_NAME_LENGHT,
    PRODUCT_DESCRIPTION_LENGHT,
    PRODUCT_PHOTOS_QTY,
    PRODUCT_WEIGHT_G,
    PRODUCT_LENGTH_CM,
    PRODUCT_HEIGHT_CM,
    PRODUCT_WIDTH_CM

FROM {{ source('flachavanne_ecommerce_raw2', 'products') }}
where PRODUCT_ID is not null