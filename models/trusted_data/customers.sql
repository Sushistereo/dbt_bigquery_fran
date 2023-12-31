{{ config(materialized="table") }}

SELECT
    CUSTOMER_ID
  , CUSTOMER_UNIQUE_ID
  , CUSTOMER_ZIP_CODE_PREFIX
  , UPPER(TRIM(CUSTOMER_CITY)) as CUSTOMER_CITY
  , UPPER(TRIM(CUSTOMER_STATE)) AS CUSTOMER_STATE
FROM {{ source('flachavanne_ecommerce_raw2', 'customers') }}
WHERE CUSTOMER_UNIQUE_ID IS NOT NULL
