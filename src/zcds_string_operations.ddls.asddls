@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity with String Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_STRING_OPERATIONS as select from scustom 
{
  key id, // Original fields
  name,  // Original fields

  concat('Company', name) as title_name, // CONCAT: Concatenate form and name
 
  concat_with_space('Company', name, 1) as title_space_name,// CONCAT: Concatenate form and name with space
  
  length(name) as name_length, // LENGTH: Calculate the length of the name
  
  left(name, 4) as first_four_chars, // LEFT: Extract the first 4 characters of the name

  right(name, 4) as last_four_chars, // RIGHT: Extract the last 4 characters of the name
  
  lower(name) as lowercase_name, // LOWER: Convert the name to lowercase
  
  upper(name) as uppercase_name,// UPPER: Convert the name to uppercase
  
  // SUBSTRING: Extract a substring starting at position 2 with a length of 3
  substring(name, 2, 3) as substring_name, 
  
  replace(name, 'Ltd', 'LLP') as updated_name, // REPLACE: Replace 'Ltd' with 'LLP' in the name
  
  instr(name, 'Ltd') as position_at, // INSTR: Find the position of 'Ltd' in the name

  ltrim(name,'*') as left_trimmed_name, // LTRIM: Remove trailing blanks and leading characters

  rtrim(name,'*') as right_trimmed_name, // RTRIM: Remove trailing blanks and trailing characters
  
  // LPAD: Pad the name to the left with '*' to make it 15 characters long
  lpad(name, 15, '/') as left_padded_name,

  // RPAD: Pad the name to the right with '*' to make it 15 characters long
  rpad(name, 15, '/') as right_padded_name
    
  

} where id = '00000001' 
