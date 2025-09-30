@EndUserText.label: 'CDS Table Function to consume AMDP with select option'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define table function ZCDS_SELECTOPTION_DP
  with parameters
    sel_opt_carrid : abap.char( 1000 )
returns
{
  mandt    : s_mandt;
  carrid   : s_carr_id;
  carrname : s_carrname;
  currcode : s_currcode;
  url      : s_carrurl;

}
implemented by method
  ZCL_AMDP_SELECTOPT=>AMDP_FUNCTION;
