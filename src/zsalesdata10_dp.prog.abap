*&---------------------------------------------------------------------*
*& Report zsalesdata10_dp
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsalesdata10_dp.

DATA itab TYPE TABLE OF zsaleshdr10_dp.
* fill internal travel table (itab)
itab = VALUE #(
 ( salesorderuuid = '02D5290E594C1EDA93815057FD946624' salesorder = '1000000001' salesordertype = 'OR' description = 'iPhone'
 soldtoparty = 'Demo_user1' salesorganization = '0001' distributionchannel = '01' documentreason = '1'
 totalnetamount = '700.00' transactioncurrency = 'USD' createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1'
 lastchangedat = '20250711140753.1472620' locallastchangedat = '20250711140753.1472620' )
 ( salesorderuuid = '02D5290E594C1EDA93815057FD946625' salesorder = '1000000002' salesordertype = 'OR' description = 'Lenovo Laptop'
 soldtoparty = 'Demo_user2' salesorganization = '0001' distributionchannel = '01' documentreason = '1'
 totalnetamount = '1000.00' transactioncurrency = 'USD' createdbyuser = 'USER1' creationat = '20250713111129.2391370' lastchangedbyuser = 'USER1'
 lastchangedat = '20250713111129.2391370' locallastchangedat = '20250713111129.2391370' )
).
* delete existing entries in the database table
DELETE FROM zsaleshdr10_dp.
IF sy-subrc = 0.
ENDIF.
* insert the new table entries
INSERT zsaleshdr10_dp FROM TABLE @itab.
IF sy-subrc = 0.
ENDIF.


DATA itabitem TYPE TABLE OF zsalesitem10_dp.
* fill internal travel table (itab)
itabitem = VALUE #(
 ( salesitemuuid = '12D5290E594C1EDA93815057FD946624' salesorderuuid = '02D5290E594C1EDA93815057FD946624'
 salesorderitem = '00010' salesorderitemcategory = 'TAQB' salesorderitemtext = 'touch screen' material = '1110000980'
 plant = '010' orderquantity = '1' orderquantityunit = 'EA' netamount = '300' transactioncurrency = 'USD'
 createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1' lastchangedat = '20250711140753.1472620'
 locallastchangedat = '20250711140753.1472620' )
  ( salesitemuuid = '12D5290E594C1EDA93815057FD946625' salesorderuuid = '02D5290E594C1EDA93815057FD946624'
 salesorderitem = '00020' salesorderitemcategory = 'TAQB' salesorderitemtext = 'cables' material = '1112200911'
 plant = '010' orderquantity = '2' orderquantityunit = 'EA' netamount = '400' transactioncurrency = 'USD'
 createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1' lastchangedat = '20250711140753.1472620'
 locallastchangedat = '20250711140753.1472620' )
 ( salesitemuuid = '12D5290E594C1EDA93815057FD946626' salesorderuuid = '02D5290E594C1EDA93815057FD946625'
 salesorderitem = '00010' salesorderitemcategory = 'TAQB' salesorderitemtext = 'wide screen' material = '1110000981'
 plant = '010' orderquantity = '1' orderquantityunit = 'EA' netamount = '500' transactioncurrency = 'USD'
 createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1'
 lastchangedat = '20250711140753.1472620' locallastchangedat = '20250711140753.1472620' )
  ( salesitemuuid = '12D5290E594C1EDA93815057FD946627' salesorderuuid = '02D5290E594C1EDA93815057FD946625'
 salesorderitem = '00020' salesorderitemcategory = 'TAQB' salesorderitemtext = 'keyboard' material = '1220550933'
 plant = '010' orderquantity = '1' orderquantityunit = 'EA' netamount = '300' transactioncurrency = 'USD'
 createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1'
 lastchangedat = '20250711140753.1472620' locallastchangedat = '20250711140753.1472620' )
   ( salesitemuuid = '12D5290E594C1EDA93815057FD946628' salesorderuuid = '02D5290E594C1EDA93815057FD946625'
 salesorderitem = '00030' salesorderitemcategory = 'TAQB' salesorderitemtext = 'cables' material = '1112200911'
 plant = '010' orderquantity = '3' orderquantityunit = 'EA' netamount = '200' transactioncurrency = 'USD'
 createdbyuser = 'USER1' creationat = '20250613111129.2391370' lastchangedbyuser = 'USER1'
 lastchangedat = '20250711140753.1472620' locallastchangedat = '20250711140753.1472620' )
 ).
* delete existing entries in the database table
DELETE FROM zsalesitem10_dp.
* insert the new table entries
INSERT zsalesitem10_dp FROM TABLE @itabitem.
IF sy-subrc = 0.
ENDIF.
