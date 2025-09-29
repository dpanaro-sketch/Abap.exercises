CLASS lhc_salesitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validatePlant FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesItem~validatePlant.

ENDCLASS.

CLASS lhc_salesitem IMPLEMENTATION.

  METHOD validatePlant.

    READ ENTITIES OF zi_SalesHdr10_dp IN LOCAL MODE
    ENTITY SalesItem
    FIELDS ( Plant ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_Items).

    SELECT FROM t001w WITH PRIVILEGED ACCESS
    FIELDS werks
    FOR ALL ENTRIES IN @lt_Items
    WHERE werks = @lt_Items-plant
    INTO TABLE @DATA(lt_plants).

    LOOP AT lt_Items ASSIGNING FIELD-SYMBOL(<fwa_items>).

      READ TABLE lt_plants WITH KEY werks = <fwa_items>-Plant
                           TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        APPEND VALUE #( %tky     = <fwa_items>-%tky ) TO failed-salesitem.

        APPEND VALUE #( %tky     = <fwa_items>-%tky
                        %msg     = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = 'Plant does not exist'
                        ) ) TO reported-salesitem.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.



CLASS lhc_SalesHdr DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesHdr RESULT result.
    METHODS calcsalesorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR saleshdr~calcsalesorderid.
    METHODS setcomplete FOR MODIFY
      IMPORTING keys FOR ACTION saleshdr~setcomplete RESULT result.

ENDCLASS.

CLASS lhc_SalesHdr IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD calcSalesOrderId.

    READ ENTITIES OF ZI_SalesHdr10_dp IN LOCAL MODE
    ENTITY SalesHdr
    FIELDS ( Salesorder ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_sales).

    DELETE lt_sales WHERE Salesorder IS NOT INITIAL.
    IF lt_sales IS NOT INITIAL.

      SELECT SINGLE FROM zsaleshdr10_dp
          FIELDS MAX( salesorder ) AS Salesorderid
          INTO @DATA(lv_maxorderid).

      IF sy-subrc = 0 AND lv_maxorderid IS NOT INITIAL.

        LOOP AT lt_sales ASSIGNING FIELD-SYMBOL(<fwa_sale>).

          MODIFY ENTITIES OF ZI_SalesHdr10_dp IN LOCAL MODE
           ENTITY SalesHdr
           UPDATE
            FIELDS ( Salesorder )
            WITH VALUE #( (
                            %tky        = <fwa_sale>-%tky
                            salesorder  = lv_maxorderid + 1
                         ) ).
        ENDLOOP.
      ENDIF.

    ENDIF.

  ENDMETHOD.

  METHOD setComplete.

    MODIFY ENTITIES OF ZI_SalesHdr10_dp IN LOCAL MODE
             ENTITY SalesHdr
             UPDATE
              FIELDS ( Status )
              WITH VALUE #( FOR key IN keys
                            ( %tky   = key-%tky
                              status = 'C' )
                          ).

    READ ENTITIES OF  ZI_SalesHdr10_dp IN LOCAL MODE
    ENTITY SalesHdr
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_sales).

    result = VALUE #( FOR lwa_sale IN lt_sales
                        ( %tky   = lwa_sale-%tky
                          %param = lwa_sale )
                    ).

  ENDMETHOD.

ENDCLASS.
