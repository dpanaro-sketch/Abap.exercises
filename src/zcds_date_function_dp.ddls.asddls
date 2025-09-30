@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity with Date Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_DATE_FUNCTION_DP
  as select from sflight
{
  key carrid,
  key connid,
  key fldate,

      // Check if fldate is valid using DATS_IS_VALID
      dats_is_valid(fldate)                          as is_valid_date,

      // Calculate days between fldate and current date using DATS_DAYS_BETWEEN
      dats_days_between($session.system_date,fldate) as days_between,

      // Add 2 days to fldate using DATS_ADD_DAYS
      // "FAIL": Raises an exception if an error occurs.
      dats_add_days(fldate, 2, 'FAIL')               as after_adding_days,

      // Subtract 2 days to fldate using DATS_ADD_DAYS
      // "NULL": Returns a null value if an error occurs.
      dats_add_days(fldate, -2, 'NULL')              as after_sub_days,

      // Add 2 months to fldate using DATS_ADD_MONTHS
      // "INITIAL": Returns the initial value (00010101) if an error occurs
      dats_add_months(fldate, 2, 'INITIAL')          as after_adding_months,

      // subtract 2 months to fldate using DATS_ADD_MONTHS
      // "UNCHANGED": Returns the unmodified value of date if an error occurs
      dats_add_months(fldate, -2, 'UNCHANGED')       as after_sub_months
}
where
      carrid = 'AA'
  and connid = '0017'
//  and fldate = '20250323'
