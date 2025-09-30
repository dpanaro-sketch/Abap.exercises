@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity with Time Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_TIME_OPERATIONS
  as select from demo_expressions
{
    // Select the key field 'id' from the demo_expressions table
    key id,
    tims1 as time1,

    // Use the TIMS_IS_VALID function to check if 'tims1' is a valid time value
    // Result is a boolean (true or false) and is aliased as 'valid_tims'
    tims_is_valid(tims1) as valid_tims,

    timestamp1 as timestamp1,

    // Use the TSTMP_IS_VALID function to check if 'timestamp1' is a valid timestamp
    // Result is a boolean (true or false) and is aliased as 'valid_timestamp'
    tstmp_is_valid(timestamp1) as valid_timestamp,

    // This field will be used to specify the number of seconds to add to a timestamp
    num1 as add_seconds,

    // Use the TSTMP_ADD_SECONDS function to add 'num1' seconds to 'timestamp1'
    // The CAST function ensures 'num1' is treated as a decimal value (abap.dec(15,0))
    // 'FAIL' error handling raises an exception if an error occurs
    tstmp_add_seconds( timestamp1, cast( num1 as abap.dec(15,0) ), 'FAIL' ) as add_timestamp,

    // Select the field 'timestamp2' and alias it as 'timestamp2'
    timestamp2 as timestamp2,

    // Use the TSTMP_SECONDS_BETWEEN function to calculate the difference in seconds
    // between 'timestamp1' and 'timestamp2'
    // 'FAIL' error handling raises an exception if an error occurs
    tstmp_seconds_between( timestamp1, timestamp2,  'FAIL' ) as difference,

    // Use the TSTMP_CURRENT_UTCTIMESTAMP function to retrieve the current UTC timestamp
    tstmp_current_utctimestamp( ) as UTC_time
} where id = 'T'
