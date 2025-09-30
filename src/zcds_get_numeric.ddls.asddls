@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity example with numeric function'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_GET_NUMERIC
  as select from sbook
{
  key carrid    as airline_code,
  key connid    as flight_number,
  key fldate    as flight_date,
  key bookid    as booking_number,
      customid  as customer_number,
      @Semantics.amount.currencyCode: 'local_currency_key'
      loccuram  as local_currency_amount,
      loccurkey as local_currency_key,
      smoker    as smoker,
      case
      when smoker = 'X' then get_numeric_value( loccuram ) + 50
      else get_numeric_value( loccuram )
      end       as extra_charge
} 
