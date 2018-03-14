****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_LBWT  $   12;
LENGTH I_LBWT  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_LBWT0 = 'Predicted: LBWT=0' ;
label P_LBWT1 = 'Predicted: LBWT=1' ;
label Q_LBWT0 = 'Unadjusted P: LBWT=0' ;
label Q_LBWT1 = 'Unadjusted P: LBWT=1' ;
label V_LBWT0 = 'Validated: LBWT=0' ;
label V_LBWT1 = 'Validated: LBWT=1' ;
label R_LBWT0 = 'Residual: LBWT=0' ;
label R_LBWT1 = 'Residual: LBWT=1' ;
label F_LBWT = 'From: LBWT' ;
label I_LBWT = 'Into: LBWT' ;
label U_LBWT = 'Unnormalized Into: LBWT' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
 
 
_ARBFMT_12 = PUT( LBWT , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_LBWT );
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_12 = PUT( ETHNICITYDAD , BEST12.);
 %DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('9' ,'5' ,'2' ) THEN DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_LBWT0  =     0.37105643994211;
  P_LBWT1  =     0.62894356005788;
  Q_LBWT0  =     0.37105643994211;
  Q_LBWT1  =     0.62894356005788;
  V_LBWT0  =     0.38846480067854;
  V_LBWT1  =     0.61153519932145;
  I_LBWT  = '1' ;
  U_LBWT  =                    1;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( HYPERPR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('1' ) THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_LBWT0  =     0.26923076923076;
    P_LBWT1  =     0.73076923076923;
    Q_LBWT0  =     0.26923076923076;
    Q_LBWT1  =     0.73076923076923;
    V_LBWT0  =     0.26896551724137;
    V_LBWT1  =     0.73103448275862;
    I_LBWT  = '1' ;
    U_LBWT  =                    1;
    END;
  ELSE DO;
    _ARBFMT_12 = PUT( smoker , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
      IF  NOT MISSING(YrsLastLiveBirth ) AND
                         1.5 <= YrsLastLiveBirth  THEN DO;
        _ARBFMT_12 = PUT( PRETERM , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
          _NODE_  =                   30;
          _LEAF_  =                    7;
          P_LBWT0  =                0.375;
          P_LBWT1  =                0.625;
          Q_LBWT0  =                0.375;
          Q_LBWT1  =                0.625;
          V_LBWT0  =     0.29090909090909;
          V_LBWT1  =      0.7090909090909;
          I_LBWT  = '1' ;
          U_LBWT  =                    1;
          END;
        ELSE DO;
          _ARBFMT_12 = PUT( HYDRAM , BEST12.);
           %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ) THEN DO;
            _NODE_  =                   36;
            _LEAF_  =                    8;
            P_LBWT0  =     0.36363636363636;
            P_LBWT1  =     0.63636363636363;
            Q_LBWT0  =     0.36363636363636;
            Q_LBWT1  =     0.63636363636363;
            V_LBWT0  =     0.26666666666666;
            V_LBWT1  =     0.73333333333333;
            I_LBWT  = '1' ;
            U_LBWT  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   37;
            _LEAF_  =                    9;
            P_LBWT0  =     0.75175233644859;
            P_LBWT1  =      0.2482476635514;
            Q_LBWT0  =     0.75175233644859;
            Q_LBWT1  =      0.2482476635514;
            V_LBWT0  =     0.75236966824644;
            V_LBWT1  =     0.24763033175355;
            I_LBWT  = '0' ;
            U_LBWT  =                    0;
            END;
          END;
        END;
      ELSE DO;
        _ARBFMT_12 = PUT( HYDRAM , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
          _NODE_  =                   28;
          _LEAF_  =                    4;
          P_LBWT0  =     0.22857142857142;
          P_LBWT1  =     0.77142857142857;
          Q_LBWT0  =     0.22857142857142;
          Q_LBWT1  =     0.77142857142857;
          V_LBWT0  =     0.26530612244897;
          V_LBWT1  =     0.73469387755102;
          I_LBWT  = '1' ;
          U_LBWT  =                    1;
          END;
        ELSE DO;
          _ARBFMT_12 = PUT( ECLAMP , BEST12.);
           %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ) THEN DO;
            _NODE_  =                   35;
            _LEAF_  =                    6;
            P_LBWT0  =     0.05263157894736;
            P_LBWT1  =     0.94736842105263;
            Q_LBWT0  =     0.05263157894736;
            Q_LBWT1  =     0.94736842105263;
            V_LBWT0  =              0.09375;
            V_LBWT1  =              0.90625;
            I_LBWT  = '1' ;
            U_LBWT  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   34;
            _LEAF_  =                    5;
            P_LBWT0  =      0.6065239551478;
            P_LBWT1  =     0.39347604485219;
            Q_LBWT0  =      0.6065239551478;
            Q_LBWT1  =     0.39347604485219;
            V_LBWT0  =     0.60348468848996;
            V_LBWT1  =     0.39651531151003;
            I_LBWT  = '0' ;
            U_LBWT  =                    0;
            END;
          END;
        END;
      END;
    ELSE DO;
      _NODE_  =                   12;
      _LEAF_  =                    3;
      P_LBWT0  =     0.43401015228426;
      P_LBWT1  =     0.56598984771573;
      Q_LBWT0  =     0.43401015228426;
      Q_LBWT1  =     0.56598984771573;
      V_LBWT0  =     0.39927623642943;
      V_LBWT1  =     0.60072376357056;
      I_LBWT  = '1' ;
      U_LBWT  =                    1;
      END;
    END;
  END;
 
*****  RESIDUALS R_ *************;
IF  F_LBWT  NE '0'
AND F_LBWT  NE '1'  THEN DO;
        R_LBWT0  = .;
        R_LBWT1  = .;
 END;
 ELSE DO;
       R_LBWT0  =  -P_LBWT0 ;
       R_LBWT1  =  -P_LBWT1 ;
       SELECT( F_LBWT  );
          WHEN( '0'  ) R_LBWT0  = R_LBWT0  +1;
          WHEN( '1'  ) R_LBWT1  = R_LBWT1  +1;
       END;
 END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;