****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_SubroFlag  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_SubroFlag1 = 'Predicted: SubroFlag=1' ;
label P_SubroFlag0 = 'Predicted: SubroFlag=0' ;
label Q_SubroFlag1 = 'Unadjusted P: SubroFlag=1' ;
label Q_SubroFlag0 = 'Unadjusted P: SubroFlag=0' ;
label V_SubroFlag1 = 'Validated: SubroFlag=1' ;
label V_SubroFlag0 = 'Validated: SubroFlag=0' ;
label I_SubroFlag = 'Into: SubroFlag' ;
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_24 $     24; DROP _ARBFMT_24;
_ARBFMT_24 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_24 = PUT( Cause , $24.);
 %DMNORMIP( _ARBFMT_24);
IF _ARBFMT_24 IN ('MVA' ) THEN DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_SubroFlag1  =     0.91477272727272;
  P_SubroFlag0  =     0.08522727272727;
  Q_SubroFlag1  =     0.91477272727272;
  Q_SubroFlag0  =     0.08522727272727;
  V_SubroFlag1  =     0.91959798994974;
  V_SubroFlag0  =     0.08040201005025;
  I_SubroFlag  = '1' ;
  U_SubroFlag  =                    1;
  END;
ELSE DO;
  _ARBFMT_24 = PUT( Body , $24.);
   %DMNORMIP( _ARBFMT_24);
  IF _ARBFMT_24 IN ('MULTIPLE' ,'FINGER' ,'ANKLE' ,'KNEE' ,'HAND' ,'BACK' ,
    'ARM' ,'WRIST' ,'LEG' ,'SPINE' ,'FOOT' ,'HEAD' ,'TOES' ,'JAW' ,'GROIN' ,
    'EYE' ,'TORSO' ,'ELBOW' ,'RIBS' ,'FACE' ,'TOOTH' ) THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    2;
    P_SubroFlag1  =     0.27651217596229;
    P_SubroFlag0  =      0.7234878240377;
    Q_SubroFlag1  =     0.27651217596229;
    Q_SubroFlag0  =      0.7234878240377;
    V_SubroFlag1  =     0.26801619433198;
    V_SubroFlag0  =     0.73198380566801;
    I_SubroFlag  = '0' ;
    U_SubroFlag  =                    0;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    3;
    P_SubroFlag1  =     0.78260869565217;
    P_SubroFlag0  =     0.21739130434782;
    Q_SubroFlag1  =     0.78260869565217;
    Q_SubroFlag0  =     0.21739130434782;
    V_SubroFlag1  =     0.63529411764705;
    V_SubroFlag0  =     0.36470588235294;
    I_SubroFlag  = '1' ;
    U_SubroFlag  =                    1;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
