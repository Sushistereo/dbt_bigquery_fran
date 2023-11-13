{{ config(materialized="table") }}

SELECT
    s.SELLER_ID,
    s.SELLER_ZIP_CODE_PREFIX,
    g.GEOLOCATION_LAT,
    g.GEOLOCATION_LNG,
    g.GEOLOCATION_CITY,
    g.GEOLOCATION_STATE
FROM {{ ref('sellers') }} s
    LEFT JOIN {{ ref('geolocation') }} g
        ON s.SELLER_ZIP_CODE_PREFIX = g.GEOLOCATION_ZIP_CODE_PREFIX
WHERE s.SELLER_ID IS NOT NULL