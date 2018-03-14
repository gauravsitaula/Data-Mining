****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_SubroFlag  $   12;
LENGTH I_SubroFlag  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_SubroFlag0 = 'Predicted: SubroFlag=0' ;
label P_SubroFlag1 = 'Predicted: SubroFlag=1' ;
label Q_SubroFlag0 = 'Unadjusted P: SubroFlag=0' ;
label Q_SubroFlag1 = 'Unadjusted P: SubroFlag=1' ;
label V_SubroFlag0 = 'Validated: SubroFlag=0' ;
label V_SubroFlag1 = 'Validated: SubroFlag=1' ;
label R_SubroFlag0 = 'Residual: SubroFlag=0' ;
label R_SubroFlag1 = 'Residual: SubroFlag=1' ;
label F_SubroFlag = 'From: SubroFlag' ;
label I_SubroFlag = 'Into: SubroFlag' ;
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_24 $     24; DROP _ARBFMT_24;
_ARBFMT_24 = ' '; /* Initialize to avoid warning. */
 
 
_ARBFMT_12 = PUT( SubroFlag , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_SubroFlag );
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_24 = PUT( Cause , $24.);
 %DMNORMIP( _ARBFMT_24);
IF _ARBFMT_24 IN ('MVA' ) THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    4;
  P_SubroFlag0  =                0.075;
  P_SubroFlag1  =                0.925;
  Q_SubroFlag0  =                0.075;
  Q_SubroFlag1  =                0.925;
  V_SubroFlag0  =     0.10344827586206;
  V_SubroFlag1  =     0.89655172413793;
  I_SubroFlag  = '1' ;
  U_SubroFlag  =                    1;
  END;
ELSE DO;
  IF  NOT MISSING(TextTopic_raw3 ) AND
                  0.0585 <= TextTopic_raw3  THEN DO;
    IF  NOT MISSING(TextTopic_raw1 ) AND
      TextTopic_raw1  <              -0.0435 THEN DO;
      _NODE_  =                   10;
      _LEAF_  =                    2;
      P_SubroFlag0  =     0.78947368421052;
      P_SubroFlag1  =     0.21052631578947;
      Q_SubroFlag0  =     0.78947368421052;
      Q_SubroFlag1  =     0.21052631578947;
      V_SubroFlag0  =     0.73684210526315;
      V_SubroFlag1  =     0.26315789473684;
      I_SubroFlag  = '0' ;
      U_SubroFlag  =                    0;
      END;
    ELSE DO;
      _NODE_  =                   11;
      _LEAF_  =                    3;
      P_SubroFlag0  =             0.390625;
      P_SubroFlag1  =             0.609375;
      Q_SubroFlag0  =             0.390625;
      Q_SubroFlag1  =             0.609375;
      V_SubroFlag0  =     0.49295774647887;
      V_SubroFlag1  =     0.50704225352112;
      I_SubroFlag  = '1' ;
      U_SubroFlag  =                    1;
      END;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_SubroFlag0  =     0.81564245810055;
    P_SubroFlag1  =     0.18435754189944;
    Q_SubroFlag0  =     0.81564245810055;
    Q_SubroFlag1  =     0.18435754189944;
    V_SubroFlag0  =     0.74731182795698;
    V_SubroFlag1  =     0.25268817204301;
    I_SubroFlag  = '0' ;
    U_SubroFlag  =                    0;
    END;
  END;
 
*****  RESIDUALS R_ *************;
IF  F_SubroFlag  NE '0'
AND F_SubroFlag  NE '1'  THEN DO;
        R_SubroFlag0  = .;
        R_SubroFlag1  = .;
 END;
 ELSE DO;
       R_SubroFlag0  =  -P_SubroFlag0 ;
       R_SubroFlag1  =  -P_SubroFlag1 ;
       SELECT( F_SubroFlag  );
          WHEN( '0'  ) R_SubroFlag0  = R_SubroFlag0  +1;
          WHEN( '1'  ) R_SubroFlag1  = R_SubroFlag1  +1;
       END;
 END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
