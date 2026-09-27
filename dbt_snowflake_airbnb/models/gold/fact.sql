{% set configs =[
    {"table":"AIRBNB_DBT.GOLD.OBT",
    "columns":"GOLD_OBT.BOOKING_ID,GOLD_OBT.LISTING_ID,GOLD_OBT.HOST_ID,GOLD_OBT.BOOKING_FEE,GOLD_OBT.CLEANING_FEE,GOLD_OBT.SERVICE_FEE,
               GOLD_OBT.ACCOMMODATES,GOLD_OBT.BEDROOMS,GOLD_OBT.BATHROOMS,GOLD_OBT.PRICE_PER_NIGHT,GOLD_OBT.RESPONSE_RATE",
    "alias": "GOLD_OBT"},

    {"table":"AIRBNB_DBT.GOLD.DIM_LISTINGS",
    "columns":"",
    "alias": "dim_listings",
    "join_condition":"GOLD_OBT.listing_id=dim_listings.listing_id AND dim_listings.dbt_valid_to=to_date('9999-12-31')"},

    {"table":"AIRBNB_DBT.GOLD.DIM_HOSTS",
    "columns":"",
    "alias": "dim_hosts",
    "join_condition":"GOLD_OBT.host_id=dim_hosts.host_id AND dim_hosts.dbt_valid_to=to_date('9999-12-31')"}
]%}

SELECT 
   {{configs[0]['columns']}}
FROM {% for config in configs %}
       {% if loop.first %}
        {{config['table']}}  AS  {{config['alias']}}
       {% else %}
        JOIN {{config['table']}} AS {{config['alias']}} ON {{config['join_condition']}}
       {% endif %}
     {%endfor%}
