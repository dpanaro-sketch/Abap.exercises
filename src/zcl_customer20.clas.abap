class ZCL_CUSTOMER20 definition
  public
  final
  create public .

public section.

  data MT_CUSTOMER type ZTCUSTOMER .
  class-data MO_INSTANCE type ref to ZCL_CUSTOMER20 .
  data MT_CUSTADDR type ZT_CUSTADDR .

  methods CUST_CREATE
    importing
      !I_CUSTOMER type ZSCUSTOMER
    returning
      value(R_CUSTOMERNO) type KUNNR .
  methods SAVE .
  class-methods GET_INSTANCE
    returning
      value(R_INSTANCE) type ref to ZCL_CUSTOMER20 .
  methods CUSTADDR_CREATE
    importing
      !IV_CUSTOMERNO type KUNNR
      !IS_CUSTADDR type ZSCUSTADDR
    returning
      value(R_ADDRESSID) type AD_ADDRNUM .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CUSTOMER20 IMPLEMENTATION.


  METHOD custaddr_create.

    DATA: ls_custaddr TYPE zcustaddr20.

    MOVE-CORRESPONDING is_custaddr TO ls_custaddr.

    SELECT SINGLE FROM zcustaddr20
    FIELDS MAX( addressid ) AS AddressID
    WHERE customerno = @iv_customerno
    INTO @DATA(max_addrid).

    IF sy-subrc = 0 AND max_addrid IS NOT INITIAL.
      ls_custaddr-addressid = max_addrid + 1.
    ELSE.
      ls_custaddr-addressid = '9000000001'.
    ENDIF.

    ls_custaddr-createdbyuser = sy-uname.

    GET TIME STAMP FIELD ls_custaddr-creationat.
    ls_custaddr-lastchangedbyuser = sy-uname.

    GET TIME STAMP FIELD ls_custaddr-locallastchangedat.
    ls_custaddr-customerno = iv_customerno.

    APPEND ls_custaddr TO mt_custaddr.

    r_addressid = ls_custaddr-addressid.

  ENDMETHOD.


  METHOD cust_create.

    DATA: ls_customer TYPE zcustomer20.

    MOVE-CORRESPONDING i_customer TO ls_customer.
    ls_customer-createdbyuser = sy-uname.

    GET TIME STAMP FIELD ls_customer-creationat.
    ls_customer-lastchangedbyuser = sy-uname.

    GET TIME STAMP FIELD ls_customer-lastchangedat.

    GET TIME STAMP FIELD ls_customer-locallastchangedat.

    SELECT SINGLE FROM zcustomer20
    FIELDS MAX( customerno ) AS Customerno
    INTO @DATA(max_custno).

    ls_customer-customerno = max_custno + 1.
    APPEND ls_customer TO mt_customer.

    r_customerno = ls_customer-customerno.

  ENDMETHOD.


  METHOD get_instance.
    IF mo_instance IS INITIAL.
      CREATE OBJECT mo_instance.
    ENDIF.
    r_instance = mo_instance.
  ENDMETHOD.


  METHOD save.

    IF mt_customer IS NOT INITIAL.
      INSERT zcustomer20 FROM TABLE mt_customer.
    ENDIF.

    IF mt_custaddr IS NOT INITIAL.
      INSERT zcustaddr20 FROM TABLE mt_custaddr.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
