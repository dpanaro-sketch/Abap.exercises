@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SALESHDR10_DP
  provider contract transactional_query
  as projection on ZI_SalesHdr10_DP as SalesHdr
{
  key Salesorderuuid,
      @Search.defaultSearchElement: true
      Salesorder,
      @Search.defaultSearchElement: true
      Salesordertype,
      Description,
      @Search.defaultSearchElement: true
      Salesorganization,
      @Search.defaultSearchElement: true
      Soldtoparty,
      @Search.defaultSearchElement: true
      Distributionchannel,
      Documentreason,
      @Semantics.amount.currencyCode: 'Transactioncurrency'
      Totalnetamount,
      Transactioncurrency,
      Status,
      Createdbyuser,
      Creationat,
      Lastchangedbyuser,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _SalesItem : redirected to composition child ZC_SALESITEM10_DP
}
