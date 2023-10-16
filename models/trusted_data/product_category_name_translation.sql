{{ config(materialized="table") }}

SELECT
    PRODUCT_CATEGORY_NAME,
    PRODUCT_CATEGORY_NAME_ENGLISH

FROM {{ source('flachavanne_ecommerce_raw2', 'product_category_name_translation') }}
where PRODUCT_CATEGORY_NAME is not null