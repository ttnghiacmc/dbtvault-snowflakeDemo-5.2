-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."PART_PK", a."PART_HASHDIFF", a."PART_NAME", a."PART_MFGR", a."PART_BRAND", a."PART_TYPE", a."PART_SIZE", a."PART_CONTAINER", a."PART_RETAILPRICE", a."PART_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_inventory AS a
    WHERE a."PART_PK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."PART_PK", stage."PART_HASHDIFF", stage."PART_NAME", stage."PART_MFGR", stage."PART_BRAND", stage."PART_TYPE", stage."PART_SIZE", stage."PART_CONTAINER", stage."PART_RETAILPRICE", stage."PART_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert