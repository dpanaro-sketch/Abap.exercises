@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity with Except and Intersect'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_INTERSECT
  as select from scarr
{
  carrid   as AirlineCode,
  carrname as AirlineName,
  currcode as CurrencyCode,
  url      as Website
}
where
  carrid like 'A_'

intersect
// except

select from scarr
{
  carrid   as AirlineCode,
  carrname as AirlineName,
  currcode as CurrencyCode,
  url      as Website
}
where
  currcode = 'USD'
