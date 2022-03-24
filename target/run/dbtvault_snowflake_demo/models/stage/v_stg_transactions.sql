
  create or replace  view DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_transactions 
  
   as (
    







-- Generated by dbtvault.



WITH source_data AS (

    SELECT

    "ORDER_ID",
    "CUSTOMER_ID",
    "ORDER_DATE",
    "TRANSACTION_DATE",
    "TRANSACTION_NUMBER",
    "AMOUNT",
    "TYPE"

    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.raw_transactions
),

derived_columns AS (

    SELECT

    "ORDER_ID",
    "CUSTOMER_ID",
    "ORDER_DATE",
    "TRANSACTION_DATE",
    "TRANSACTION_NUMBER",
    "AMOUNT",
    "TYPE",
    'RAW_TRANSACTIONS' AS "RECORD_SOURCE",
    DATEADD(DAY, 1, TRANSACTION_DATE) AS "LOAD_DATE",
    "TRANSACTION_DATE" AS "EFFECTIVE_FROM"

    FROM source_data
),

hashed_columns AS (

    SELECT

    "ORDER_ID",
    "CUSTOMER_ID",
    "ORDER_DATE",
    "TRANSACTION_DATE",
    "TRANSACTION_NUMBER",
    "AMOUNT",
    "TYPE",
    "RECORD_SOURCE",
    "LOAD_DATE",
    "EFFECTIVE_FROM",

    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_ID" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("TRANSACTION_NUMBER" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "TRANSACTION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMER_ID" AS VARCHAR))), ''))) AS BINARY(32)) AS "CUSTOMER_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("ORDER_ID" AS VARCHAR))), ''))) AS BINARY(32)) AS "ORDER_PK"

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    "ORDER_ID",
    "CUSTOMER_ID",
    "ORDER_DATE",
    "TRANSACTION_DATE",
    "TRANSACTION_NUMBER",
    "AMOUNT",
    "TYPE",
    "RECORD_SOURCE",
    "LOAD_DATE",
    "EFFECTIVE_FROM",
    "TRANSACTION_PK",
    "CUSTOMER_PK",
    "ORDER_PK"

    FROM hashed_columns
)

SELECT * FROM columns_to_select
  );
