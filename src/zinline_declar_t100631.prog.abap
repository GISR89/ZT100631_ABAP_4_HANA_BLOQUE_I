*&---------------------------------------------------------------------*
*& Report zinline_declar_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zinline_declar_t100631.

*1-declaracion en linea
*SELECT *
* FROM sflight
* INTO TABLE @DATA(gt_flights).
*
*IF sy-subrc EQ 0.
*  cl_demo_output=>display( gt_flights ).
*ENDIF.

**********************************************************************
*2-declaracion en linea con seleccion de campos
SELECT carrid, connid, price, fldate
 FROM sflight
 INTO TABLE @DATA(gt_flights).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_flights ).
ENDIF.
