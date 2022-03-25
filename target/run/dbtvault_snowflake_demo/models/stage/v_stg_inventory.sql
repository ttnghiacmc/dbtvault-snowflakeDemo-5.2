
  create or replace  view DV_PROTOTYPE_DB.dbt_ttnghiacmc.v_stg_inventory 
  
   as (
    








WITH staging AS (
-- Generated by dbtvault.



WITH source_data AS (

    SELECT

    "PARTKEY",
    "SUPPLIERKEY",
    "AVAILQTY",
    "SUPPLYCOST",
    "PART_SUPPLY_COMMENT",
    "SUPPLIER_NAME",
    "SUPPLIER_ADDRESS",
    "SUPPLIER_NATION_KEY",
    "SUPPLIER_PHONE",
    "SUPPLIER_ACCTBAL",
    "SUPPLIER_COMMENT",
    "PART_NAME",
    "PART_MFGR",
    "PART_BRAND",
    "PART_TYPE",
    "PART_SIZE",
    "PART_CONTAINER",
    "PART_RETAILPRICE",
    "PART_COMMENT",
    "SUPPLIER_NATION_NAME",
    "SUPPLIER_NATION_COMMENT",
    "SUPPLIER_REGION_KEY",
    "SUPPLIER_REGION_NAME",
    "SUPPLIER_REGION_COMMENT"

    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.raw_inventory
),

derived_columns AS (

    SELECT

    "PARTKEY",
    "SUPPLIERKEY",
    "AVAILQTY",
    "SUPPLYCOST",
    "PART_SUPPLY_COMMENT",
    "SUPPLIER_NAME",
    "SUPPLIER_ADDRESS",
    "SUPPLIER_NATION_KEY",
    "SUPPLIER_PHONE",
    "SUPPLIER_ACCTBAL",
    "SUPPLIER_COMMENT",
    "PART_NAME",
    "PART_MFGR",
    "PART_BRAND",
    "PART_TYPE",
    "PART_SIZE",
    "PART_CONTAINER",
    "PART_RETAILPRICE",
    "PART_COMMENT",
    "SUPPLIER_NATION_NAME",
    "SUPPLIER_NATION_COMMENT",
    "SUPPLIER_REGION_KEY",
    "SUPPLIER_REGION_NAME",
    "SUPPLIER_REGION_COMMENT",
    "SUPPLIER_NATION_KEY" AS "NATION_KEY",
    "SUPPLIER_REGION_KEY" AS "REGION_KEY",
    'TPCH-INVENTORY' AS "RECORD_SOURCE"

    FROM source_data
),

hashed_columns AS (

    SELECT

    "PARTKEY",
    "SUPPLIERKEY",
    "AVAILQTY",
    "SUPPLYCOST",
    "PART_SUPPLY_COMMENT",
    "SUPPLIER_NAME",
    "SUPPLIER_ADDRESS",
    "SUPPLIER_NATION_KEY",
    "SUPPLIER_PHONE",
    "SUPPLIER_ACCTBAL",
    "SUPPLIER_COMMENT",
    "PART_NAME",
    "PART_MFGR",
    "PART_BRAND",
    "PART_TYPE",
    "PART_SIZE",
    "PART_CONTAINER",
    "PART_RETAILPRICE",
    "PART_COMMENT",
    "SUPPLIER_NATION_NAME",
    "SUPPLIER_NATION_COMMENT",
    "SUPPLIER_REGION_KEY",
    "SUPPLIER_REGION_NAME",
    "SUPPLIER_REGION_COMMENT",
    "NATION_KEY",
    "REGION_KEY",
    "RECORD_SOURCE",

    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "SUPPLIER_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "SUPPLIER_NATION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "SUPPLIER_REGION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "REGION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "NATION_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_KEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "NATION_REGION_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_KEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "LINK_SUPPLIER_NATION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "PART_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "INVENTORY_PK",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_ACCTBAL" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_ADDRESS" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NAME" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_PHONE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "SUPPLIER_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_BRAND" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_CONTAINER" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_MFGR" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_NAME" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_RETAILPRICE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_SIZE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_TYPE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "PART_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_REGION_NAME" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "SUPPLIER_REGION_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIER_NATION_NAME" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "SUPPLIER_NATION_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("AVAILQTY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PART_SUPPLY_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLYCOST" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "INVENTORY_HASHDIFF"

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    "PARTKEY",
    "SUPPLIERKEY",
    "AVAILQTY",
    "SUPPLYCOST",
    "PART_SUPPLY_COMMENT",
    "SUPPLIER_NAME",
    "SUPPLIER_ADDRESS",
    "SUPPLIER_NATION_KEY",
    "SUPPLIER_PHONE",
    "SUPPLIER_ACCTBAL",
    "SUPPLIER_COMMENT",
    "PART_NAME",
    "PART_MFGR",
    "PART_BRAND",
    "PART_TYPE",
    "PART_SIZE",
    "PART_CONTAINER",
    "PART_RETAILPRICE",
    "PART_COMMENT",
    "SUPPLIER_NATION_NAME",
    "SUPPLIER_NATION_COMMENT",
    "SUPPLIER_REGION_KEY",
    "SUPPLIER_REGION_NAME",
    "SUPPLIER_REGION_COMMENT",
    "NATION_KEY",
    "REGION_KEY",
    "RECORD_SOURCE",
    "SUPPLIER_PK",
    "SUPPLIER_NATION_PK",
    "SUPPLIER_REGION_PK",
    "REGION_PK",
    "NATION_PK",
    "NATION_REGION_PK",
    "LINK_SUPPLIER_NATION_PK",
    "PART_PK",
    "INVENTORY_PK",
    "SUPPLIER_HASHDIFF",
    "PART_HASHDIFF",
    "SUPPLIER_REGION_HASHDIFF",
    "SUPPLIER_NATION_HASHDIFF",
    "INVENTORY_HASHDIFF"

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *, 
       TO_DATE('CURRENT_TIMESTAMP()') AS LOAD_DATE,
       TO_DATE('CURRENT_TIMESTAMP()') AS EFFECTIVE_FROM
FROM staging
  );
