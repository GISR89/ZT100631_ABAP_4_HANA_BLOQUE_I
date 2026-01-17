*&---------------------------------------------------------------------*
*& Report ztime_funct_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztime_funct_t100631.

DATA(gv_seconds) = 3600.

GET TIME STAMP FIELD DATA(gv_timestamp).

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id = 'L'
                                         num1 = gv_seconds
                                         timestamp1 = gv_timestamp ) ).

TRY.
    SELECT SINGLE FROM demo_expressions
           FIELDS id,
                  num1,
                  timestamp1,
                  tstmp_is_valid( timestamp1 ) AS valid,
                  tstmp_seconds_between( tstmp1 = tstmp_current_utctimestamp( ),
                                         tstmp2 = tstmp_add_seconds( tstmp = timestamp1,
                                                                     seconds = CAST( num1 AS DEC( 15,0 ) ),
                                                                     on_error = @sql_tstmp_add_seconds=>fail ),
                                         on_error = @sql_tstmp_seconds_between=>fail ) AS difference
           WHERE id EQ 'L'
           INTO @DATA(gs_results).

  CATCH cx_sy_open_sql_db INTO DATA(gx_sql_db).
    cl_demo_output=>display( gx_sql_db->get_text( ) ).
    RETURN.
ENDTRY.

cl_demo_output=>display( gs_results ).

*convert time stamp gv_timestamp
*        time zone 'UTC'
*        into date data(gv_date)
*             time data(gv_time).
*
*write: / gv_date, gv_time.
*
*convert utclong conv utclong( '2025-09-22 11:10:00' )
*        into date gv_date
*             time gv_time
*             DAYLIGHT SAVING TIME data(gv_dst)
*             time zone 'CET'.
*
*write: / gv_date, gv_time.
