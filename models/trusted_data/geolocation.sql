{{ config(materialized="table") }}

SELECT
    GEOLOCATION_ZIP_CODE_PREFIX,
    GEOLOCATION_LAT,
    GEOLOCATION_LNG,
    lower(TRIM(GEOLOCATION_CITY)) GEOLOCATION_CITY,
    upper(trim(GEOLOCATION_STATE)) GEOLOCATION_STATE
FROM {{ source('flachavanne_ecommerce_raw2', 'geolocation') }}
WHERE GEOLOCATION_ZIP_CODE_PREFIX IS NOT NULL