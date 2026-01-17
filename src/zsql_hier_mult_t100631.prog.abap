*&---------------------------------------------------------------------*
*& Report zsql_hier_mult_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_hier_mult_t100631.

TRY.

    SELECT FROM HIERARCHY(  SOURCE demo_cds_parent_child_source
                            CHILD TO PARENT ASSOCIATION _relat
                            START WHERE id = 'A'
                            SIBLINGS ORDER BY id ASCENDING
                            DEPTH 0
                            MULTIPLE PARENTS LEAVES ONLY )
    FIELDS id, parent, hierarchy_level
    INTO TABLE @DATA(gt_results).

  CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
    lx_sql_db->get_longtext(  ).
ENDTRY.

cl_demo_output=>display( gt_results ).
