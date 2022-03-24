-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."PART_PK", rr."PARTKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."PART_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_orders AS rr
    WHERE rr."PART_PK" IS NOT NULL
    QUALIFY row_number = 1
),

row_rank_2 AS (
    SELECT rr."PART_PK", rr."PARTKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."PART_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_inventory AS rr
    WHERE rr."PART_PK" IS NOT NULL
    QUALIFY row_number = 1
),

stage_union AS (
    SELECT * FROM row_rank_1
    UNION ALL
    SELECT * FROM row_rank_2
),

row_rank_union AS (
    SELECT ru.*,
           ROW_NUMBER() OVER(
               PARTITION BY ru."PART_PK"
               ORDER BY ru."LOAD_DATE", ru."RECORD_SOURCE" ASC
           ) AS row_rank_number
    FROM stage_union AS ru
    WHERE ru."PART_PK" IS NOT NULL
    QUALIFY row_rank_number = 1
),

records_to_insert AS (
    SELECT a."PART_PK", a."PARTKEY", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_union AS a
)

SELECT * FROM records_to_insert