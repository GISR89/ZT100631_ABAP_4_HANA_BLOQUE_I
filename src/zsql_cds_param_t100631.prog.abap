*&---------------------------------------------------------------------*
*& Report zsql_cds_param_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_cds_param_t100631.

CONSTANTS: gc_from_distance TYPE s_distance VALUE 2000,
           gc_to_distance   TYPE s_distance VALUE 6000,
           gc_unit          TYPE s_distid VALUE 'MI'.

SELECT FROM demo_cds_parameters( p_distance_l = @gc_from_distance,
                                 p_distance_u = @gc_to_distance,
                                 p_unit = @gc_unit )
     FIELDS *
     ORDER BY carrid, connid
     INTO TABLE @DATA(gt_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_results ).
ENDIF.
