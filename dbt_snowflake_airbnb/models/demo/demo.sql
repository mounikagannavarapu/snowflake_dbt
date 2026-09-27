{{ config(materialized='view') }}

SELECT * FROM AIRBNB_DBT.STAGING.LISTINGS