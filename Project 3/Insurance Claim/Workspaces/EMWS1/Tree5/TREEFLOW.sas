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


_ARBFMT_12 = PUT( SubroFlag , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_SubroFlag );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(TextCluster4_SVD1 ) AND 
      0.20079012459351 <= TextCluster4_SVD1  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_SubroFlag0  =     0.11363636363636;
  P_SubroFlag1  =     0.88636363636363;
  Q_SubroFlag0  =     0.11363636363636;
  Q_SubroFlag1  =     0.88636363636363;
  V_SubroFlag0  =     0.16666666666666;
  V_SubroFlag1  =     0.83333333333333;
  I_SubroFlag  = '1' ;
  U_SubroFlag  =                    1;
  END;
ELSE DO;
  IF  NOT MISSING(TextTopic3_raw7 ) AND 
                   0.007 <= TextTopic3_raw7  THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_SubroFlag0  =     0.32258064516129;
    P_SubroFlag1  =      0.6774193548387;
    Q_SubroFlag0  =     0.32258064516129;
    Q_SubroFlag1  =      0.6774193548387;
    V_SubroFlag0  =      0.4516129032258;
    V_SubroFlag1  =     0.54838709677419;
    I_SubroFlag  = '1' ;
    U_SubroFlag  =                    1;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_SubroFlag0  =     0.76651982378854;
    P_SubroFlag1  =     0.23348017621145;
    Q_SubroFlag0  =     0.76651982378854;
    Q_SubroFlag1  =     0.23348017621145;
    V_SubroFlag0  =     0.73275862068965;
    V_SubroFlag1  =     0.26724137931034;
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

