CLASS zcl_amdp_selectopt DEFINITION PUBLIC. " public - global class
  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS amdp_function FOR TABLE FUNCTION ZCDS_SELECTOPTION_DP.
ENDCLASS.



CLASS zcl_amdp_selectopt IMPLEMENTATION.
  METHOD amdp_function BY DATABASE FUNCTION
                          FOR HDB
                          LANGUAGE SQLSCRIPT
                          OPTIONS READ-ONLY
                          USING scarr.

    lt_scarr = apply_filter (scarr , :sel_opt_carrid );

              RETURN select mandt, carrid, carrname, currcode, url
                            from :lt_scarr ;

  ENDMETHOD.
ENDCLASS.
