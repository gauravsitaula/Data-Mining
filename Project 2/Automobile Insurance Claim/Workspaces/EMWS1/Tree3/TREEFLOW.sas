****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_CLAIM_IND  $   12; 
LENGTH I_CLAIM_IND  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_CLAIM_IND0 = 'Predicted: CLAIM_IND=0' ;
label P_CLAIM_IND1 = 'Predicted: CLAIM_IND=1' ;
label Q_CLAIM_IND0 = 'Unadjusted P: CLAIM_IND=0' ;
label Q_CLAIM_IND1 = 'Unadjusted P: CLAIM_IND=1' ;
label V_CLAIM_IND0 = 'Validated: CLAIM_IND=0' ;
label V_CLAIM_IND1 = 'Validated: CLAIM_IND=1' ;
label R_CLAIM_IND0 = 'Residual: CLAIM_IND=0' ;
label R_CLAIM_IND1 = 'Residual: CLAIM_IND=1' ;
label F_CLAIM_IND = 'From: CLAIM_IND' ;
label I_CLAIM_IND = 'Into: CLAIM_IND' ;
label U_CLAIM_IND = 'Unnormalized Into: CLAIM_IND' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_13 $     13; DROP _ARBFMT_13; 
_ARBFMT_13 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_21 $     21; DROP _ARBFMT_21; 
_ARBFMT_21 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_5 $      5; DROP _ARBFMT_5; 
_ARBFMT_5 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_3 $      3; DROP _ARBFMT_3; 
_ARBFMT_3 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_11 $     11; DROP _ARBFMT_11; 
_ARBFMT_11 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( CLAIM_IND , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_CLAIM_IND );

******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_21 = PUT( AREA , $21.);
 %DMNORMIP( _ARBFMT_21);
IF _ARBFMT_21 IN ('Z_HIGHLY RURAL/ RURAL' ) THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                   11;
  P_CLAIM_IND0  =     0.93540669856459;
  P_CLAIM_IND1  =      0.0645933014354;
  Q_CLAIM_IND0  =     0.93540669856459;
  Q_CLAIM_IND1  =      0.0645933014354;
  V_CLAIM_IND0  =     0.93567961165048;
  V_CLAIM_IND1  =     0.06432038834951;
  I_CLAIM_IND  = '0' ;
  U_CLAIM_IND  =                    0;
  END;
ELSE DO;
  _ARBFMT_13 = PUT( JOB , $13.);
   %DMNORMIP( _ARBFMT_13);
  IF _ARBFMT_13 IN ('TEACHER' ,'HOME MAKER' ,'CLERICAL' ,'STUDENT' ) THEN DO;
    _ARBFMT_5 = PUT( STATUS , $5.);
     %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('Z_NO' ) THEN DO;
      _ARBFMT_11 = PUT( VEHICLE_TYPE , $11.);
       %DMNORMIP( _ARBFMT_11);
      IF _ARBFMT_11 IN ('SPORTS CAR' ,'PANEL TRUCK' ,'VAN' ,'PICKUP' ) THEN 
        DO;
        _NODE_  =                   16;
        _LEAF_  =                    4;
        P_CLAIM_IND0  =     0.29752066115702;
        P_CLAIM_IND1  =     0.70247933884297;
        Q_CLAIM_IND0  =     0.29752066115702;
        Q_CLAIM_IND1  =     0.70247933884297;
        V_CLAIM_IND0  =      0.4156378600823;
        V_CLAIM_IND1  =     0.58436213991769;
        I_CLAIM_IND  = '1' ;
        U_CLAIM_IND  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(DISTANCE ) AND 
              85.9929255747592 <= DISTANCE  THEN DO;
          _NODE_  =                   29;
          _LEAF_  =                    6;
          P_CLAIM_IND0  =     0.35849056603773;
          P_CLAIM_IND1  =     0.64150943396226;
          Q_CLAIM_IND0  =     0.35849056603773;
          Q_CLAIM_IND1  =     0.64150943396226;
          V_CLAIM_IND0  =     0.45794392523364;
          V_CLAIM_IND1  =     0.54205607476635;
          I_CLAIM_IND  = '1' ;
          U_CLAIM_IND  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   28;
          _LEAF_  =                    5;
          P_CLAIM_IND0  =     0.56981132075471;
          P_CLAIM_IND1  =     0.43018867924528;
          Q_CLAIM_IND0  =     0.56981132075471;
          Q_CLAIM_IND1  =     0.43018867924528;
          V_CLAIM_IND0  =      0.5042735042735;
          V_CLAIM_IND1  =     0.49572649572649;
          I_CLAIM_IND  = '0' ;
          U_CLAIM_IND  =                    0;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_3 = PUT( REVOKED , $3.);
       %DMNORMIP( _ARBFMT_3);
      IF _ARBFMT_3 IN ('YES' ) THEN DO;
        _ARBFMT_10 = PUT( CAR_USE , $10.);
         %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('PRIVATE' ) THEN DO;
          _NODE_  =                   22;
          _LEAF_  =                    1;
          P_CLAIM_IND0  =     0.56716417910447;
          P_CLAIM_IND1  =     0.43283582089552;
          Q_CLAIM_IND0  =     0.56716417910447;
          Q_CLAIM_IND1  =     0.43283582089552;
          V_CLAIM_IND0  =     0.54794520547945;
          V_CLAIM_IND1  =     0.45205479452054;
          I_CLAIM_IND  = '0' ;
          U_CLAIM_IND  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   23;
          _LEAF_  =                    2;
          P_CLAIM_IND0  =     0.35211267605633;
          P_CLAIM_IND1  =     0.64788732394366;
          Q_CLAIM_IND0  =     0.35211267605633;
          Q_CLAIM_IND1  =     0.64788732394366;
          V_CLAIM_IND0  =     0.25454545454545;
          V_CLAIM_IND1  =     0.74545454545454;
          I_CLAIM_IND  = '1' ;
          U_CLAIM_IND  =                    1;
          END;
        END;
      ELSE DO;
        _NODE_  =                   15;
        _LEAF_  =                    3;
        P_CLAIM_IND0  =     0.64819277108433;
        P_CLAIM_IND1  =     0.35180722891566;
        Q_CLAIM_IND0  =     0.64819277108433;
        Q_CLAIM_IND1  =     0.35180722891566;
        V_CLAIM_IND0  =     0.64713216957606;
        V_CLAIM_IND1  =     0.35286783042394;
        I_CLAIM_IND  = '0' ;
        U_CLAIM_IND  =                    0;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(CHILD_DRIV ) AND 
                       0.5 <= CHILD_DRIV  THEN DO;
      _ARBFMT_5 = PUT( STATUS , $5.);
       %DMNORMIP( _ARBFMT_5);
      IF _ARBFMT_5 IN ('Z_NO' ) THEN DO;
        _NODE_  =                   21;
        _LEAF_  =                   10;
        P_CLAIM_IND0  =     0.34782608695652;
        P_CLAIM_IND1  =     0.65217391304347;
        Q_CLAIM_IND0  =     0.34782608695652;
        Q_CLAIM_IND1  =     0.65217391304347;
        V_CLAIM_IND0  =     0.36923076923076;
        V_CLAIM_IND1  =     0.63076923076923;
        I_CLAIM_IND  = '1' ;
        U_CLAIM_IND  =                    1;
        END;
      ELSE DO;
        _ARBFMT_3 = PUT( REVOKED , $3.);
         %DMNORMIP( _ARBFMT_3);
        IF _ARBFMT_3 IN ('YES' ) THEN DO;
          _NODE_  =                   34;
          _LEAF_  =                    8;
          P_CLAIM_IND0  =     0.21428571428571;
          P_CLAIM_IND1  =     0.78571428571428;
          Q_CLAIM_IND0  =     0.21428571428571;
          Q_CLAIM_IND1  =     0.78571428571428;
          V_CLAIM_IND0  =     0.35714285714285;
          V_CLAIM_IND1  =     0.64285714285714;
          I_CLAIM_IND  = '1' ;
          U_CLAIM_IND  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   35;
          _LEAF_  =                    9;
          P_CLAIM_IND0  =                 0.65;
          P_CLAIM_IND1  =                 0.35;
          Q_CLAIM_IND0  =                 0.65;
          Q_CLAIM_IND1  =                 0.35;
          V_CLAIM_IND0  =     0.59493670886075;
          V_CLAIM_IND1  =     0.40506329113924;
          I_CLAIM_IND  = '0' ;
          U_CLAIM_IND  =                    0;
          END;
        END;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    7;
      P_CLAIM_IND0  =     0.83289986996098;
      P_CLAIM_IND1  =     0.16710013003901;
      Q_CLAIM_IND0  =     0.83289986996098;
      Q_CLAIM_IND1  =     0.16710013003901;
      V_CLAIM_IND0  =     0.81057810578105;
      V_CLAIM_IND1  =     0.18942189421894;
      I_CLAIM_IND  = '0' ;
      U_CLAIM_IND  =                    0;
      END;
    END;
  END;

*****  RESIDUALS R_ *************;
IF  F_CLAIM_IND  NE '0' 
AND F_CLAIM_IND  NE '1'  THEN DO; 
        R_CLAIM_IND0  = .;
        R_CLAIM_IND1  = .;
 END;
 ELSE DO;
       R_CLAIM_IND0  =  -P_CLAIM_IND0 ;
       R_CLAIM_IND1  =  -P_CLAIM_IND1 ;
       SELECT( F_CLAIM_IND  );
          WHEN( '0'  ) R_CLAIM_IND0  = R_CLAIM_IND0  +1;
          WHEN( '1'  ) R_CLAIM_IND1  = R_CLAIM_IND1  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
