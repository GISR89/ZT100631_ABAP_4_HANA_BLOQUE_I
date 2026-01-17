*&---------------------------------------------------------------------*
*& Report zunion_t100631
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zunion_t100631.

CLASS lcl_sql_union DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS lcl_sql_union IMPLEMENTATION.

  METHOD main.

*    INSERT zint_t100631 FROM TABLE @( VALUE #( ( product_id = 'P1'
*                                                 description = 'Placa Base Asus ROG Zenith' )
*                                               ( product_id = 'P2'
*                                                 description = 'Procesador I9-7980XE 2.6Ghz' )
*                                               ( product_id = 'P3'
*                                                 description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*                                               ( product_id = 'P4'
*                                                 description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' ) ) ).
*
*    INSERT zext_t100631 FROM TABLE @( VALUE #(  ( product_id = 'P3'
*                                                  description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*                                                ( product_id = 'P4'
*                                                  description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' )
*                                                ( product_id = 'P5'
*                                                  description = 'Tarjeta Gráfica - PNY NVIDIA Quadro P6000 24GB GDDR5X' )
*                                                ( product_id = 'P6'
*                                                  description = 'Fuente de aliimentación - EVGA Supernova G2 1600W 80 Plus Gold' ) ) ).

    SELECT FROM zint_t100631
          FIELDS product_id,
                 description
    UNION DISTINCT
    SELECT FROM zext_t100631
          FIELDS product_id,
                 description
    INTO TABLE @DATA(lt_union_distinct).

    IF sy-subrc EQ 0.
      cl_demo_output=>display( lt_union_distinct ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_sql_union=>main(  ).
