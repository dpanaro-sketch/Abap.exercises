@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Item Projection View'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SALESITEM10_DP
  as projection on ZI_SalesItem10_DP as SalesItem
{
  key Salesitemuuid,
      Salesorderuuid,
      Salesorderitem,
      Salesorderitemcategory,
      Salesorderitemtext,
      Material,
      Plant,
      @Semantics.quantity.unitOfMeasure:
      'Orderquantityunit'
      Orderquantity,
      Orderquantityunit,
      @Semantics.amount.currencyCode: 'Transactioncurrency'
      Netamount,
      Transactioncurrency,
      Createdbyuser,
      Creationat,
      Lastchangedbyuser,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _SalesHdr : redirected to parent ZC_SALESHDR10_DP
}
