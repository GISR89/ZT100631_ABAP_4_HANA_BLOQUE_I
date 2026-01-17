*&---------------------------------------------------------------------*
*& Report zsql_hints_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_hints_t100631.

SELECT FROM sflight
FIELDS *
WHERE carrid EQ 'AA'
%_HINTS HDB 'INDEX_SEARCH'
INTO TABLE @DATA(gt_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_results ).
ENDIF.
