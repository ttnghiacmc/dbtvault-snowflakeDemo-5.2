SELECT
    a.L_ORDERKEY AS ORDERKEY,
    a.L_PARTKEY AS PARTKEY ,
    a.L_SUPPKEY AS SUPPLIERKEY,
    a.L_LINENUMBER AS LINENUMBER,
    a.L_QUANTITY AS QUANTITY,
    a.L_EXTENDEDPRICE AS EXTENDEDPRICE,
    a.L_DISCOUNT AS DISCOUNT,
    a.L_TAX AS TAX,
    a.L_RETURNFLAG AS RETURNFLAG,
    a.L_LINESTATUS AS LINESTATUS,
    a.L_SHIPDATE AS SHIPDATE,
    a.L_COMMITDATE AS COMMITDATE,
    a.L_RECEIPTDATE AS RECEIPTDATE,
    a.L_SHIPINSTRUCT AS SHIPINSTRUCT,
    a.L_SHIPMODE AS SHIPMODE,
    a.L_COMMENT AS LINE_COMMENT,
    b.O_CUSTKEY AS CUSTOMERKEY,
    b.O_ORDERSTATUS AS ORDERSTATUS,
    b.O_TOTALPRICE AS TOTALPRICE,
    b.O_ORDERDATE AS ORDERDATE,
    b.O_ORDERPRIORITY AS ORDERPRIORITY,
    b.O_CLERK AS CLERK,
    b.O_SHIPPRIORITY AS SHIPPRIORITY,
    b.O_COMMENT AS ORDER_COMMENT,
    c.C_NAME AS CUSTOMER_NAME,
    c.C_ADDRESS AS CUSTOMER_ADDRESS,
    c.C_NATIONKEY AS CUSTOMER_NATION_KEY,
    c.C_PHONE AS CUSTOMER_PHONE,
    c.C_ACCTBAL AS CUSTOMER_ACCBAL,
    c.C_MKTSEGMENT AS CUSTOMER_MKTSEGMENT,
    c.C_COMMENT AS CUSTOMER_COMMENT,
    d.N_NAME AS CUSTOMER_NATION_NAME,
    d.N_REGIONKEY AS CUSTOMER_REGION_KEY,
    d.N_COMMENT AS CUSTOMER_NATION_COMMENT,
    e.R_NAME AS CUSTOMER_REGION_NAME,
    e.R_COMMENT AS CUSTOMER_REGION_COMMENT
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS AS b
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.LINEITEM AS a
    ON a.L_ORDERKEY = b.O_ORDERKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER AS c
    ON b.O_CUSTKEY  = c.C_CUSTKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.NATION AS d
    ON c.C_NATIONKEY  = d.N_NATIONKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.REGION AS e
    ON d.N_REGIONKEY  = e.R_REGIONKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.PART AS g
    ON a.L_PARTKEY = g.P_PARTKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.SUPPLIER AS h
    ON a.L_SUPPKEY = h.S_SUPPKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.NATION AS j
    ON h.S_NATIONKEY = j.N_NATIONKEY
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.REGION AS k
    ON j.N_REGIONKEY = k.R_REGIONKEY
WHERE b.O_ORDERDATE = TO_DATE('CURRENT_TIMESTAMP()')