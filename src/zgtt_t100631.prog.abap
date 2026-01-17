*&---------------------------------------------------------------------*
*& Report zgtt_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgtt_t100631.


INSERT zgt_empl_t100631 FROM TABLE @( VALUE #( ( employee_number = 123
                                                 name = 'Pepito'
                                                 last_name = 'Perez'
                                                 gender = 'M' ) ) ).

INSERT ztb_empl_t100631 FROM TABLE @( VALUE #( ( employee_number = 456
                                                 name = 'Maria'
                                                 last_name = 'Lopez'
                                                 gender = 'F' ) ) ).

SELECT FROM  ztb_empl_t100631
     FIELDS employee_number,
            name,
            last_name,
            gender
     UNION ALL
SELECT FROM  zgt_empl_t100631
      FIELDS employee_number,
            name,
            last_name,
            gender
     INTO TABLE @DATA(gt_employees)   .

ROLLBACK WORK.

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_employees ) .
ENDIF.
