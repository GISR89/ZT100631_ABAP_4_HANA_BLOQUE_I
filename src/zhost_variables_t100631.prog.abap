*&---------------------------------------------------------------------*
*& Report zhost_variables_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhost_variables_t100631.

DATA gv_carrid TYPE s_carr_id VALUE 'AA'.

DATA:
  BEGIN OF gs_result,
    carrid TYPE sflight-carrid,
    connid TYPE sflight-connid,
  END OF gs_result.

DATA go_ref LIKE REF TO gs_result.

go_ref = NEW #( ).

* variables host de tipo estructura
SELECT SINGLE FROM sflight
  FIELDS carrid, connid
  WHERE carrid EQ @gv_carrid
  INTO CORRESPONDING FIELDS OF @gs_result.

ASSIGN gs_result TO FIELD-SYMBOL(<fs_result>).

* variables host de tipo puntero
SELECT SINGLE FROM sflight
  FIELDS carrid, connid
  WHERE carrid EQ @gv_carrid
  INTO CORRESPONDING FIELDS OF @<fs_result>.

* variables host de tipo referenciado
SELECT SINGLE FROM sflight
  FIELDS carrid, connid
  WHERE carrid EQ @gv_carrid
  INTO CORRESPONDING FIELDS OF @go_ref->*.

cl_demo_output=>new(
)->next_section( title = 'Structure Host Variable'
)->write( gs_result
)->next_section( title = 'Field Symbol Host Variable'
)->write( <fs_result>
)->next_section( title = 'Reference Host Variable'
)->write( go_ref->* )->display( ).
