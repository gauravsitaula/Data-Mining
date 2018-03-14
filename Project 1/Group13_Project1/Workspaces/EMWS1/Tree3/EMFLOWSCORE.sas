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
  _ARBFMT_12 = PUT( HYPERPR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('1' ,'9' ) THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_LBWT0  =     0.17595307917888;
    P_LBWT1  =     0.82404692082111;
    Q_LBWT0  =     0.17595307917888;
    Q_LBWT1  =     0.82404692082111;
    V_LBWT0  =     0.18654434250764;
    V_LBWT1  =     0.81345565749235;
    I_LBWT  = '1' ;
    U_LBWT  =                    1;
    END;
  ELSE DO;
    IF  NOT MISSING(PRENATAL ) AND
                       0.5 <= PRENATAL  THEN DO;
      _ARBFMT_12 = PUT( PRETERM , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    3;
        P_LBWT0  =     0.10309278350515;
        P_LBWT1  =     0.89690721649484;
        Q_LBWT0  =     0.10309278350515;
        Q_LBWT1  =     0.89690721649484;
        V_LBWT0  =     0.12903225806451;
        V_LBWT1  =     0.87096774193548;
        I_LBWT  = '1' ;
        U_LBWT  =                    1;
        END;
      ELSE DO;
        _ARBFMT_12 = PUT( ECLAMP , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
          _NODE_  =                   22;
          _LEAF_  =                    4;
          P_LBWT0  =     0.04166666666666;
          P_LBWT1  =     0.95833333333333;
          Q_LBWT0  =     0.04166666666666;
          Q_LBWT1  =     0.95833333333333;
          V_LBWT0  =     0.10416666666666;
          V_LBWT1  =     0.89583333333333;
          I_LBWT  = '1' ;
          U_LBWT  =                    1;
          END;
        ELSE DO;
          _ARBFMT_12 = PUT( CERVIX , BEST12.);
           %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ) THEN DO;
            _NODE_  =                   32;
            _LEAF_  =                    5;
            P_LBWT0  =     0.04651162790697;
            P_LBWT1  =     0.95348837209302;
            Q_LBWT0  =     0.04651162790697;
            Q_LBWT1  =     0.95348837209302;
            V_LBWT0  =     0.09677419354838;
            V_LBWT1  =     0.90322580645161;
            I_LBWT  = '1' ;
            U_LBWT  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   33;
            _LEAF_  =                    6;
            P_LBWT0  =     0.43023679417122;
            P_LBWT1  =     0.56976320582877;
            Q_LBWT0  =     0.43023679417122;
            Q_LBWT1  =     0.56976320582877;
            V_LBWT0  =     0.44555160142348;
            V_LBWT1  =     0.55444839857651;
            I_LBWT  = '1' ;
            U_LBWT  =                    1;
            END;
          END;
        END;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    2;
      P_LBWT0  =     0.14917127071823;
      P_LBWT1  =     0.85082872928176;
      Q_LBWT0  =     0.14917127071823;
      Q_LBWT1  =     0.85082872928176;
      V_LBWT0  =     0.19289340101522;
      V_LBWT1  =     0.80710659898477;
      I_LBWT  = '1' ;
      U_LBWT  =                    1;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( HYPERPR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('1' ) THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    7;
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
          _LEAF_  =                   14;
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
            _LEAF_  =                   15;
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
            _LEAF_  =                   16;
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
          _LEAF_  =                   11;
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
            _LEAF_  =                   13;
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
            _LEAF_  =                   12;
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
      _ARBFMT_12 = PUT( HYDRAM , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
        _NODE_  =                   18;
        _LEAF_  =                    8;
        P_LBWT0  =     0.09090909090909;
        P_LBWT1  =      0.9090909090909;
        Q_LBWT0  =     0.09090909090909;
        Q_LBWT1  =      0.9090909090909;
        V_LBWT0  =     0.06666666666666;
        V_LBWT1  =     0.93333333333333;
        I_LBWT  = '1' ;
        U_LBWT  =                    1;
        END;
      ELSE DO;
        _ARBFMT_12 = PUT( UTERINE , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
          _NODE_  =                   26;
          _LEAF_  =                    9;
          P_LBWT0  =                    0;
          P_LBWT1  =                    1;
          Q_LBWT0  =                    0;
          Q_LBWT1  =                    1;
          V_LBWT0  =     0.06666666666666;
          V_LBWT1  =     0.93333333333333;
          I_LBWT  = '1' ;
          U_LBWT  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   27;
          _LEAF_  =                   10;
          P_LBWT0  =     0.45625841184387;
          P_LBWT1  =     0.54374158815612;
          Q_LBWT0  =     0.45625841184387;
          Q_LBWT1  =     0.54374158815612;
          V_LBWT0  =     0.41836734693877;
          V_LBWT1  =     0.58163265306122;
          I_LBWT  = '1' ;
          U_LBWT  =                    1;
          END;
        END;
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
