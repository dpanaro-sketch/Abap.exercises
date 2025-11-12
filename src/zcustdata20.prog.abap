*&---------------------------------------------------------------------*
*& Report zcustdata20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcustdata20.

DATA itab TYPE TABLE OF zcustomer20.

* fill internal customer table (itab)
itab = VALUE #(
  ( customerno = '100000001' firstname = 'Peter' lastname = 'Parker' phone = '562241783' createdbyuser = 'USER1' creationat = '20190711140753.1472620'
    lastchangedat = '20190711140753.1472620' locallastchangedat = '20190711140753.1472620' )
  ( customerno = '100000002' firstname = 'Tony' lastname = 'Stark' phone = '562241821' createdbyuser = 'USER1' creationat = '20190711140753.1472620'
    lastchangedat = '20190713111129.2391370' locallastchangedat = '20190713111129.2391370' )
).

** delete existing entries in the database table
DELETE FROM zcustomer20.

* insert the new table entries
INSERT zcustomer20 FROM TABLE itab.

DATA itab2 TYPE TABLE OF zcustaddr20.

* fill internal address table (itab)
itab2 = VALUE #(
  ( customerno = '100000001' addressid = '90000001' city = 'New York' district = 'Queens' postalcode = '11375' country = 'US' street = 'Road 123'
    createdbyuser = 'USER2' creationat = '20190711140753.1472620' lastchangedbyuser = '20190711140753.1472620'  locallastchangedat = '20190711140753.1472620' )
  ( customerno = '100000002' addressid = '90000002' city = 'California' district = 'Malibu' postalcode = '90265' country = 'US' street = 'Rivadavia 444'
    createdbyuser = 'USER2' creationat = '20190711140753.1472620' lastchangedbyuser = '20190711140753.1472620'  locallastchangedat = '20190711140753.1472620')
    ( customerno = '100000002' addressid = '90000003' city = 'Manhatan' district = 'Bronx' postalcode = '33766' country = 'US' street = 'Cachimayo 22'
    createdbyuser = 'USER2' creationat = '20190711140753.1472620' lastchangedbyuser = '20190711140753.1472620'  locallastchangedat = '20190711140753.1472620')
).

* delete existing entries in the database table
DELETE FROM zcustaddr20.

* insert the new table entries
INSERT zcustaddr20 FROM TABLE @itab2.
