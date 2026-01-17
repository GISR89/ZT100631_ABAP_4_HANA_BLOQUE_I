*&---------------------------------------------------------------------*
*& Report zcase_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcase_t100631.

CLASS lcl_sql_case DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS lcl_sql_case IMPLEMENTATION.

  METHOD main.

    DATA(lcl_random) = cl_abap_random_int=>create( seed = CONV i( sy-uzeit )
                                                   min = 1
                                                   max = 100 ).

    INSERT demo_expressions FROM TABLE @( VALUE #(
                                      FOR i = 0 UNTIL i > 9 (  id = i
                                                             num1 = lcl_random->get_next( )
                                                             num2 = lcl_random->get_next( )  ) ) ).

    SELECT FROM demo_expressions
           FIELDS num1,
                  num2,
                  CASE
                     WHEN num1 < 50 AND num2 < 50 THEN 'Ambos < de 50'
                     WHEN num1 > 50 AND num2 > 50 THEN 'Ambos > de 50'
                     WHEN num1 = 50 AND num2 = 50 THEN 'Ambos = de 50'
                     ELSE 'Otro'
                  END AS number
                  ORDER BY number
                  INTO TABLE @DATA(lt_results).

    IF sy-subrc EQ 0.
      cl_demo_output=>display( lt_results ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

lcl_sql_case=>main(  ).
