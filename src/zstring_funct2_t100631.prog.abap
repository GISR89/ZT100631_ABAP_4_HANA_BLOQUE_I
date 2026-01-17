*&---------------------------------------------------------------------*
*& Report zstring_funct2_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstring_funct2_t100631.

DATA lv_char TYPE c LENGTH 6 VALUE 'LOGALI'.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 'L'
                                         char1 = 'AABbCDDe'
                                         char2 = '123456' ) ).

SELECT SINGLE FROM demo_expressions
       FIELDS id,
              char1,
              char2,
              left( char1, 2 ) AS left,
              right( char1, 3 ) AS right,
              lpad( char2, 18, '0' ) AS lpad,
              rpad( char2, 18, '0' ) AS rpad,
              ltrim( char1, 'A' ) AS ltrim,
              rtrim( char1, 'e' ) AS rtrim,
              instr( char1, 'bC' ) AS instr,
              length( char1 ) AS length,
              replace( char1, 'DD', '__' ) AS replace,
              substring( char1, 3, 2 ) AS substring,
              lower( char1 ) AS lower,
              upper( char1 ) AS upper
      WHERE id EQ 'L'
      INTO @DATA(gs_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gs_results ).
ENDIF.
