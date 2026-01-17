*&---------------------------------------------------------------------*
*& Report zsql_with_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_with_t100631.

WITH +tmp_table AS (
       SELECT FROM scarr
          FIELDS carrname,
                 CAST( ' ' AS CHAR( 4 ) ) AS connid,
                 ' ' AS cityfrom,
                 ' ' AS cityto
          WHERE carrid = 'LH'
UNION
      SELECT FROM spfli
        FIELDS ' ' AS carrname,
         CAST( connid AS CHAR( 4 ) ) AS connid,
                     cityfrom,
                     cityto
        WHERE carrid = 'LH' )

SELECT FROM +tmp_table
    FIELDS *
    ORDER BY carrname DESCENDING
    INTO TABLE @DATA(gt_results).

cl_demo_output=>display( gt_results ).
