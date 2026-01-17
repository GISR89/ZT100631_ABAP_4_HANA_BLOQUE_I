*&---------------------------------------------------------------------*
*& Report znumeric_functions_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znumeric_functions_t100631.

DATA: gv_offset  TYPE i VALUE 18,
      gv_decimal TYPE p LENGTH 13 DECIMALS 4 VALUE '27.0671'.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 1
                                         num1 = 14
                                         num2 = 8 ) ).

SELECT SINGLE FROM demo_expressions
       FIELDS id,
              num1,
              num2,
              CAST( num1 AS FLTP ) / CAST( num2 AS FLTP ) AS ratio,
              division( num1, num2, 2 ) AS division,
              div( num1, num2 ) AS div,
              mod( num1, num2 ) AS mod,
              num1 + num2 + @gv_offset AS sum,
              abs( num1 - num2 ) AS abs,
              @gv_decimal AS decimal,
              ceil( @gv_decimal ) AS ceil,
              floor( @gv_decimal ) AS floor,
              round( @gv_decimal, 2 ) AS round
       WHERE id EQ 1
       INTO @DATA(gs_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gs_results ).
ENDIF.
