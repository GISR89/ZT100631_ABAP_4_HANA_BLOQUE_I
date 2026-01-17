*&---------------------------------------------------------------------*
*& Report zsql_hierarchy_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_hierarchy_t100631.

select from HIERARCHY(  source DEMO_CDS_SIMPLE_TREE_SOURCE
                        CHILD TO PARENT ASSOCIATION _tree
                        START WHERE id = 1
                        SIBLINGS ORDER BY id ASCENDING
                        DEPTH 1 )
fields id, parent, name, hierarchy_level
into table @data(gt_results).

cl_demo_output=>display( gt_results ).
