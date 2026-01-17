*&---------------------------------------------------------------------*
*& Report zdate_time_conv_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdate_time_conv_t100631.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 'L'
                                         dats1 = '20300101'
                                         tims1 = '103040' ) ).

DATA gv_tzone TYPE timezone.

CALL FUNCTION 'GET_SYSTEM_TIMEZONE'
  IMPORTING
    timezone = gv_tzone.

SELECT SINGLE FROM demo_expressions
       FIELDS tstmp_current_utctimestamp( ) AS current_utc,
              tstmp_to_dats( tstmp = tstmp_current_utctimestamp( ),
                             tzone = @gv_tzone,
                             client = @sy-mandt,
                             on_error = @sql_tstmp_to_dats=>set_to_null ) AS to_dats,
              tstmp_to_tims( tstmp = tstmp_current_utctimestamp( ),
                             tzone = @gv_tzone,
                             client = @sy-mandt,
                             on_error = @sql_tstmp_to_tims=>set_to_null ) AS to_tims,
              tstmp_to_dst( tstmp = tstmp_current_utctimestamp( ),
                            tzone = @gv_tzone,
                            client = @sy-mandt,
                            on_error = @sql_tstmp_to_dst=>set_to_null ) AS to_dst,
              dats_tims_to_tstmp( date = dats1,
                                  time = tims1,
                                  tzone = @gv_tzone,
                                  client = @sy-mandt,
                                  on_error = @sql_dats_tims_to_tstmp=>set_to_null ) AS to_tstmp
       WHERE id EQ 'L'
       INTO @DATA(gs_result).

CHECK sy-subrc EQ 0.
cl_demo_output=>display( gs_result ).
