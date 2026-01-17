*&---------------------------------------------------------------------*
*& Report ztime_zone_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztime_zone_t100631.

SELECT SINGLE FROM demo_expressions
       FIELDS abap_system_timezone( client = @sy-mandt,
                                    on_error = @sql_abap_system_timezone=>set_to_null ) AS system_tz,
              abap_user_timezone( user = @sy-uname,
                                  on_error = @sql_abap_user_timezone=>set_to_null ) AS user_tz
       INTO @DATA(gs_result).

cl_demo_output=>display( gs_result ).
