{{config(materialized='incremental',unique_key='LISTING_ID')}}

SELECT LISTING_ID, HOST_ID,
{{trim_upper('PROPERTY_TYPE',node)}} AS PROPERTY_TYPE,
{{trim_upper('COUNTRY',node)}} AS COUNTRY,
{{trim_upper('CITY',node)}} AS CITY,
ACCOMMODATES,
BEDROOMS,
BATHROOMS,
PRICE_PER_NIGHT,
{{tag('CAST(PRICE_PER_NIGHT AS INT)')}} AS PRICE_TAG,
CREATED_AT
FROM {{ref('bronze_listings')}}