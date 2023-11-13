{{ config(materialized="table") }}

SELECT
    c.CUSTOMER_ID,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    g.GEOLOCATION_LAT,
    g.GEOLOCATION_LNG,
    g.GEOLOCATION_CITY,
    g.GEOLOCATION_STATE
FROM {{ ref('customers') }} c
    LEFT JOIN {{ ref('geolocation') }} g
        ON c.customer_zip_code_prefix = g.GEOLOCATION_ZIP_CODE_PREFIX
WHERE c.CUSTOMER_ID IS NOT NULL

