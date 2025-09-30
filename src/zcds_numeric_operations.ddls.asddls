@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity with Numeric Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_NUMERIC_OPERATIONS
  as select from sflight
{
  key carrid, // Airline code (primary key field)
  key connid, // Flight connection number (primary key field)
  key fldate, // Flight date (primary key field)

      // Associates the paymentsum field with its currency field (CurrencyCode).
      @Semantics.amount.currencyCode: 'CurrencyCode'
      paymentsum                                                   as TotalAmount,   // Total of current bookings (CURR type)
      currency                                                     as CurrencyCode,  // currency code (CUKY type)
      seatsocc                                                     as NumberOfSeats, // number of seats occupied

      // GET_NUMERIC_VALUE returns the numeric value of a currency or quantity field without its currency or unit.
      // GET_NUMERIC_VALUE is used to handle CURR or QUAN types.
      get_numeric_value(paymentsum)                                as Numeric_Value_PaymentSum,

      // Computes the absolute value of paymentsum.
      abs(get_numeric_value(paymentsum) )                          as AbsolutePaymentSum,
      // Rounds paymentsum up to the nearest integer.
      ceil(get_numeric_value(paymentsum))                          as CeilPaymentSum,
      // Rounds paymentsum down to the nearest integer.
      floor(get_numeric_value(paymentsum))                         as FloorPaymentSum,
      // rounds a number to a specified number of decimal places
      round(get_numeric_value(paymentsum), 1)                      as RoundPaymentSum,

      // DIV, DIVISION and MOD require integer inputs, so we cast PAYMENTSUM to INT
      div(cast(paymentsum as abap.dec( 17, 2 )), seatsocc)         as DivPricePerSeat,
      division(cast(paymentsum as abap.dec( 17, 2 )), seatsocc, 2) as DivisionPricePerSeat,
      mod(cast(paymentsum as abap.int4), seatsocc)                 as ModPrice

}
where
      carrid = 'AA'
  and connid = '0017'
//  and fldate = '20240912'
