







WITH staging AS (
-- Generated by dbtvault.



WITH source_data AS (

    SELECT

    "ORDERKEY",
    "PARTKEY",
    "SUPPLIERKEY",
    "LINENUMBER",
    "QUANTITY",
    "EXTENDEDPRICE",
    "DISCOUNT",
    "TAX",
    "RETURNFLAG",
    "LINESTATUS",
    "SHIPDATE",
    "COMMITDATE",
    "RECEIPTDATE",
    "SHIPINSTRUCT",
    "SHIPMODE",
    "LINE_COMMENT",
    "CUSTOMERKEY",
    "ORDERSTATUS",
    "TOTALPRICE",
    "ORDERDATE",
    "ORDERPRIORITY",
    "CLERK",
    "SHIPPRIORITY",
    "ORDER_COMMENT",
    "CUSTOMER_NAME",
    "CUSTOMER_ADDRESS",
    "CUSTOMER_NATION_KEY",
    "CUSTOMER_PHONE",
    "CUSTOMER_ACCBAL",
    "CUSTOMER_MKTSEGMENT",
    "CUSTOMER_COMMENT",
    "CUSTOMER_NATION_NAME",
    "CUSTOMER_REGION_KEY",
    "CUSTOMER_NATION_COMMENT",
    "CUSTOMER_REGION_NAME",
    "CUSTOMER_REGION_COMMENT"

    FROM DV_PROTOTYPE_DB.dbt_ttnghiacmc.raw_orders
),

derived_columns AS (

    SELECT

    "ORDERKEY",
    "PARTKEY",
    "SUPPLIERKEY",
    "LINENUMBER",
    "QUANTITY",
    "EXTENDEDPRICE",
    "DISCOUNT",
    "TAX",
    "RETURNFLAG",
    "LINESTATUS",
    "SHIPDATE",
    "COMMITDATE",
    "RECEIPTDATE",
    "SHIPINSTRUCT",
    "SHIPMODE",
    "LINE_COMMENT",
    "CUSTOMERKEY",
    "ORDERSTATUS",
    "TOTALPRICE",
    "ORDERDATE",
    "ORDERPRIORITY",
    "CLERK",
    "SHIPPRIORITY",
    "ORDER_COMMENT",
    "CUSTOMER_NAME",
    "CUSTOMER_ADDRESS",
    "CUSTOMER_NATION_KEY",
    "CUSTOMER_PHONE",
    "CUSTOMER_ACCBAL",
    "CUSTOMER_MKTSEGMENT",
    "CUSTOMER_COMMENT",
    "CUSTOMER_NATION_NAME",
    "CUSTOMER_REGION_KEY",
    "CUSTOMER_NATION_COMMENT",
    "CUSTOMER_REGION_NAME",
    "CUSTOMER_REGION_COMMENT",
    "CUSTOMER_NATION_KEY" AS "NATION_KEY",
    "CUSTOMER_REGION_KEY" AS "REGION_KEY",
    'TPCH-ORDERS' AS "RECORD_SOURCE",
    "ORDERDATE" AS "EFFECTIVE_FROM"

    FROM source_data
),

hashed_columns AS (

    SELECT

    "ORDERKEY",
    "PARTKEY",
    "SUPPLIERKEY",
    "LINENUMBER",
    "QUANTITY",
    "EXTENDEDPRICE",
    "DISCOUNT",
    "TAX",
    "RETURNFLAG",
    "LINESTATUS",
    "SHIPDATE",
    "COMMITDATE",
    "RECEIPTDATE",
    "SHIPINSTRUCT",
    "SHIPMODE",
    "LINE_COMMENT",
    "CUSTOMERKEY",
    "ORDERSTATUS",
    "TOTALPRICE",
    "ORDERDATE",
    "ORDERPRIORITY",
    "CLERK",
    "SHIPPRIORITY",
    "ORDER_COMMENT",
    "CUSTOMER_NAME",
    "CUSTOMER_ADDRESS",
    "CUSTOMER_NATION_KEY",
    "CUSTOMER_PHONE",
    "CUSTOMER_ACCBAL",
    "CUSTOMER_MKTSEGMENT",
    "CUSTOMER_COMMENT",
    "CUSTOMER_NATION_NAME",
    "CUSTOMER_REGION_KEY",
    "CUSTOMER_NATION_COMMENT",
    "CUSTOMER_REGION_NAME",
    "CUSTOMER_REGION_COMMENT",
    "NATION_KEY",
    "REGION_KEY",
    "RECORD_SOURCE",
    "EFFECTIVE_FROM",

    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMERKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "CUSTOMER_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_KEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "LINK_CUSTOMER_NATION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "CUSTOMER_NATION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "CUSTOMER_REGION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "NATION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_KEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "REGION_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_KEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "NATION_REGION_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "ORDER_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "ORDER_CUSTOMER_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINENUMBER" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "LINEITEM_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINENUMBER" AS VARCHAR))), ''), '^^')
    ), '^^||^^||^^')) AS BINARY(32)) AS "LINK_LINEITEM_ORDER_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "PART_PK",
    CAST((SHA2_BINARY(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''))) AS BINARY(32)) AS "SUPPLIER_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^')) AS BINARY(32)) AS "INVENTORY_PK",
    CAST(SHA2_BINARY(NULLIF(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINENUMBER" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("PARTKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SUPPLIERKEY" AS VARCHAR))), ''), '^^')
    ), '^^||^^||^^')) AS BINARY(32)) AS "INVENTORY_ALLOCATION_PK",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_ACCBAL" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_ADDRESS" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_MKTSEGMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NAME" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_PHONE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMERKEY" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "CUSTOMER_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_NATION_NAME" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "CUSTOMER_NATION_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_KEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_REGION_NAME" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "CUSTOMER_REGION_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("COMMITDATE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("DISCOUNT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("EXTENDEDPRICE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINE_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINENUMBER" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("LINESTATUS" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("QUANTITY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("RECEIPTDATE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("RETURNFLAG" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SHIPDATE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SHIPINSTRUCT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SHIPMODE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("TAX" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "LINEITEM_HASHDIFF",
    CAST(SHA2_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST("CLERK" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDER_COMMENT" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERDATE" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERKEY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERPRIORITY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("ORDERSTATUS" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("SHIPPRIORITY" AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST("TOTALPRICE" AS VARCHAR))), ''), '^^')
    )) AS BINARY(32)) AS "ORDER_HASHDIFF"

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    "ORDERKEY",
    "PARTKEY",
    "SUPPLIERKEY",
    "LINENUMBER",
    "QUANTITY",
    "EXTENDEDPRICE",
    "DISCOUNT",
    "TAX",
    "RETURNFLAG",
    "LINESTATUS",
    "SHIPDATE",
    "COMMITDATE",
    "RECEIPTDATE",
    "SHIPINSTRUCT",
    "SHIPMODE",
    "LINE_COMMENT",
    "CUSTOMERKEY",
    "ORDERSTATUS",
    "TOTALPRICE",
    "ORDERDATE",
    "ORDERPRIORITY",
    "CLERK",
    "SHIPPRIORITY",
    "ORDER_COMMENT",
    "CUSTOMER_NAME",
    "CUSTOMER_ADDRESS",
    "CUSTOMER_NATION_KEY",
    "CUSTOMER_PHONE",
    "CUSTOMER_ACCBAL",
    "CUSTOMER_MKTSEGMENT",
    "CUSTOMER_COMMENT",
    "CUSTOMER_NATION_NAME",
    "CUSTOMER_REGION_KEY",
    "CUSTOMER_NATION_COMMENT",
    "CUSTOMER_REGION_NAME",
    "CUSTOMER_REGION_COMMENT",
    "NATION_KEY",
    "REGION_KEY",
    "RECORD_SOURCE",
    "EFFECTIVE_FROM",
    "CUSTOMER_PK",
    "LINK_CUSTOMER_NATION_PK",
    "CUSTOMER_NATION_PK",
    "CUSTOMER_REGION_PK",
    "NATION_PK",
    "REGION_PK",
    "NATION_REGION_PK",
    "ORDER_PK",
    "ORDER_CUSTOMER_PK",
    "LINEITEM_PK",
    "LINK_LINEITEM_ORDER_PK",
    "PART_PK",
    "SUPPLIER_PK",
    "INVENTORY_PK",
    "INVENTORY_ALLOCATION_PK",
    "CUSTOMER_HASHDIFF",
    "CUSTOMER_NATION_HASHDIFF",
    "CUSTOMER_REGION_HASHDIFF",
    "LINEITEM_HASHDIFF",
    "ORDER_HASHDIFF"

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *,
       TO_DATE('1992-01-09') AS LOAD_DATE
FROM staging