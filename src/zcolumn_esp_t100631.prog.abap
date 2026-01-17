*&---------------------------------------------------------------------*
*& Report zcolumn_esp_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcolumn_esp_t100631.

CONSTANTS : gc_fltime_ini TYPE s_fltime VALUE '60',
            gc_fltime_fin TYPE s_fltime VALUE '500'.

SELECT FROM spfli
FIELDS carrid, period
WHERE fltime BETWEEN @gc_fltime_ini AND @gc_fltime_fin
GROUP BY carrid, period
ORDER BY carrid DESCENDING
INTO TABLE @DATA(gt_flights).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_flights ).
ENDIF.
