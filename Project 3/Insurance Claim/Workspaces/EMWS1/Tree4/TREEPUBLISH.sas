****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
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
label I_SubroFlag = 'Into: SubroFlag' ;
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(TextTopic2_raw6 ) AND 
                 0.004 <= TextTopic2_raw6  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    5;
  P_SubroFlag0  =     0.08108108108108;
  P_SubroFlag1  =     0.91891891891891;
  Q_SubroFlag0  =     0.08108108108108;
  Q_SubroFlag1  =     0.91891891891891;
  V_SubroFlag0  =     0.26315789473684;
  V_SubroFlag1  =     0.73684210526315;
  I_SubroFlag  = '1' ;
  U_SubroFlag  =                    1;
  END;
ELSE DO;
  IF  NOT MISSING(TextCluster2_SVD10 ) AND 
        0.00793093961303 <= TextCluster2_SVD10  THEN DO;
    _ARBFMT_12 = PUT( VEHflag , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    4;
      P_SubroFlag0  =                    0;
      P_SubroFlag1  =                    1;
      Q_SubroFlag0  =                    0;
      Q_SubroFlag1  =                    1;
      V_SubroFlag0  =                 0.25;
      V_SubroFlag1  =                 0.75;
      I_SubroFlag  = '1' ;
      U_SubroFlag  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(TextTopic2_raw8 ) AND 
                      0.0035 <= TextTopic2_raw8  THEN DO;
        _NODE_  =                   13;
        _LEAF_  =                    3;
        P_SubroFlag0  =     0.72727272727272;
        P_SubroFlag1  =     0.27272727272727;
        Q_SubroFlag0  =     0.72727272727272;
        Q_SubroFlag1  =     0.27272727272727;
        V_SubroFlag0  =     0.54545454545454;
        V_SubroFlag1  =     0.45454545454545;
        I_SubroFlag  = '0' ;
        U_SubroFlag  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   12;
        _LEAF_  =                    2;
        P_SubroFlag0  =     0.21428571428571;
        P_SubroFlag1  =     0.78571428571428;
        Q_SubroFlag0  =     0.21428571428571;
        Q_SubroFlag1  =     0.78571428571428;
        V_SubroFlag0  =     0.63636363636363;
        V_SubroFlag1  =     0.36363636363636;
        I_SubroFlag  = '1' ;
        U_SubroFlag  =                    1;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_SubroFlag0  =     0.76086956521739;
    P_SubroFlag1  =      0.2391304347826;
    Q_SubroFlag0  =     0.76086956521739;
    Q_SubroFlag1  =      0.2391304347826;
    V_SubroFlag0  =     0.70796460176991;
    V_SubroFlag1  =     0.29203539823008;
    I_SubroFlag  = '0' ;
    U_SubroFlag  =                    0;
    END;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

