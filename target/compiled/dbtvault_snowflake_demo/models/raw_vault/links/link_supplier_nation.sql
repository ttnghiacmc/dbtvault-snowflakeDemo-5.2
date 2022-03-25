-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."LINK_SUPPLIER_NATION_PK", rr."SUPPLIER_PK", rr."NATION_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."LINK_SUPPLIER_NATION_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_inventory AS rr
    WHERE rr."LINK_SUPPLIER_NATION_PK" IS NOT NULL
    AND rr."SUPPLIER_PK" IS NOT NULL
    AND rr."NATION_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."LINK_SUPPLIER_NATION_PK", a."SUPPLIER_PK", a."NATION_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert