

      create or replace transient table DV_PROTOTYPE_DB.dbt_ttnghiacmc.hub_customer  as
      (-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."CUSTOMER_PK", rr."CUSTOMERKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."CUSTOMER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_orders AS rr
    WHERE rr."CUSTOMER_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."CUSTOMER_PK", a."CUSTOMERKEY", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert
      );
    