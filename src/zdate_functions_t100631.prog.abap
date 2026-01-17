*&---------------------------------------------------------------------*
*& Report zdate_functions_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdate_functions_t100631.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 'F'
                                         dats1 = '20230329'
                                         dats2 = '20250329' ) ).

SELECT SINGLE FROM demo_expressions
       FIELDS id,
              dats1,
              dats2,
              DATS_IS_VALID( dats1 ) as valid,
              DATS_DAYS_BETWEEN( dats1, dats2 ) as days_between,
              DATS_ADD_DAYS( dats1, 30 ) as add_days,
              DATS_ADD_MONTHS( dats1, -2 ) as add_months
       WHERE id EQ 'F'
       INTO @DATA(gs_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gs_results ).
ENDIF.
