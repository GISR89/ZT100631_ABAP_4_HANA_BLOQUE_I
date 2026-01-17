*&---------------------------------------------------------------------*
*& Report zstring_funct_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstring_funct_t100631.

DATA lv_char TYPE c LENGTH 6 VALUE 'LOGALI'.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 'L'
                                         char1 = 'AABbCDDe'
                                         char2 = '123456' ) ).

SELECT SINGLE FROM demo_expressions
       FIELDS id,
              char1,
              char2,
              concat( char1, char2 ) AS concat,
              concat_with_space( char1, @lv_char, 2 ) AS concat2,
              char1 && char2 && 'HANA-' && @lv_char AS ampersand
       WHERE id EQ 'L'
       INTO @DATA(gs_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gs_results ).
ENDIF.
