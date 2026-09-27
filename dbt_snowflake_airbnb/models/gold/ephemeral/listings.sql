{{config(materialized='ephemeral')}}

WITH LISTINGS AS(
    SELECT DISTINCT LISTING_ID,
           PROPERTY_TYPE,
           CITY,
           COUNTRY,
           PRICE_TAG,
           LISTING_CREATED_AT FROM {{ref('obt')}}
)
SELECT * FROM LISTINGS