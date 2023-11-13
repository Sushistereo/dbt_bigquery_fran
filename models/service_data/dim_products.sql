{{ config(materialized="table") }}

SELECT
    p.PRODUCT_ID,
    p.PRODUCT_CATEGORY_NAME,
    p.PRODUCT_NAME_LENGHT,
    p.PRODUCT_DESCRIPTION_LENGHT,
    p.PRODUCT_PHOTOS_QTY,
    p.PRODUCT_WEIGHT_G,
    p.PRODUCT_LENGTH_CM,
    p.PRODUCT_HEIGHT_CM,
    p.PRODUCT_WIDTH_CM,
    p.PRODUCT_WIDTH_CM,
    pt.PRODUCT_CATEGORY_NAME_ENGLISH
FROM {{ ref('products') }} p
    LEFT JOIN {{ ref('product_category_name_translation') }} pt
        ON p.PRODUCT_CATEGORY_NAME = pt.PRODUCT_CATEGORY_NAME
WHERE p.PRODUCT_ID IS NOT NULL