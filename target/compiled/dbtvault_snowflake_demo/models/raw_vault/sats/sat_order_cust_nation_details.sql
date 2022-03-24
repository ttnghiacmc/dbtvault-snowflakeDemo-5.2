-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."CUSTOMER_PK", a."CUSTOMER_NATION_HASHDIFF", a."CUSTOMER_NATION_NAME", a."CUSTOMER_NATION_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_orders AS a
    WHERE a."CUSTOMER_PK" IS NOT NULL
),

latest_records AS (
    SELECT a."CUSTOMER_PK", a."CUSTOMER_NATION_HASHDIFF", a."LOAD_DATE"
    FROM (
        SELECT current_records."CUSTOMER_PK", current_records."CUSTOMER_NATION_HASHDIFF", current_records."LOAD_DATE",
            RANK() OVER (
                PARTITION BY current_records."CUSTOMER_PK"
                ORDER BY current_records."LOAD_DATE" DESC
            ) AS rank
        FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.sat_order_cust_nation_details AS current_records
            JOIN (
                SELECT DISTINCT source_data."CUSTOMER_PK"
                FROM source_data
            ) AS source_records
                ON current_records."CUSTOMER_PK" = source_records."CUSTOMER_PK"
    ) AS a
    WHERE a.rank = 1
),

records_to_insert AS (
    SELECT DISTINCT stage."CUSTOMER_PK", stage."CUSTOMER_NATION_HASHDIFF", stage."CUSTOMER_NATION_NAME", stage."CUSTOMER_NATION_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
        LEFT JOIN latest_records
            ON latest_records."CUSTOMER_PK" = stage."CUSTOMER_PK"
            WHERE latest_records."CUSTOMER_NATION_HASHDIFF" != stage."CUSTOMER_NATION_HASHDIFF"
                OR latest_records."CUSTOMER_NATION_HASHDIFF" IS NULL
)

SELECT * FROM records_to_insert