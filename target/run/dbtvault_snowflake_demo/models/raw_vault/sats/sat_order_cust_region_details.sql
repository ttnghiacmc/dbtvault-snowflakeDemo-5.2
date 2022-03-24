

      create or replace transient table DV_PROTOTYPE_DB.dbt_ttnghiacmc.sat_order_cust_region_details  as
      (-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."CUSTOMER_PK", a."CUSTOMER_REGION_HASHDIFF", a."CUSTOMER_REGION_NAME", a."CUSTOMER_REGION_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_orders AS a
    WHERE a."CUSTOMER_PK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."CUSTOMER_PK", stage."CUSTOMER_REGION_HASHDIFF", stage."CUSTOMER_REGION_NAME", stage."CUSTOMER_REGION_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert
      );
    