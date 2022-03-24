

      create or replace transient table DV_PROTOTYPE_DB.dbt_ttnghiacmc.sat_inv_inventory_details  as
      (-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."INVENTORY_PK", a."INVENTORY_HASHDIFF", a."AVAILQTY", a."SUPPLYCOST", a."PART_SUPPLY_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_inventory AS a
    WHERE a."INVENTORY_PK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."INVENTORY_PK", stage."INVENTORY_HASHDIFF", stage."AVAILQTY", stage."SUPPLYCOST", stage."PART_SUPPLY_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert
      );
    