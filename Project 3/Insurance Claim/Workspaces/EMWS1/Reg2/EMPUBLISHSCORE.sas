*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_SubroFlag $ 12;
label I_SubroFlag = 'Into: SubroFlag' ;
*** Target Values;
array REG2DRF [2] $12 _temporary_ ('1' '0' );
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
*** Unnormalized target values;
ARRAY REG2DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check TextCluster2_SVD1 for missing values ;
if missing( TextCluster2_SVD1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster2_SVD10 for missing values ;
if missing( TextCluster2_SVD10 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextTopic2_raw6 for missing values ;
if missing( TextTopic2_raw6 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextTopic2_raw7 for missing values ;
if missing( TextTopic2_raw7 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3741721854;
   _P1 = 0.6258278146;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: TextCluster2_SVD1 ;
_TEMP = TextCluster2_SVD1 ;
_LP0 = _LP0 + (    3.38850590854286 * _TEMP);

***  Effect: TextCluster2_SVD10 ;
_TEMP = TextCluster2_SVD10 ;
_LP0 = _LP0 + (    1.90539624220738 * _TEMP);

***  Effect: TextTopic2_raw6 ;
_TEMP = TextTopic2_raw6 ;
_LP0 = _LP0 + (    8.61856994622636 * _TEMP);

***  Effect: TextTopic2_raw7 ;
_TEMP = TextTopic2_raw7 ;
_LP0 = _LP0 + (    2.45128008503119 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.91505997715741 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG2DR1:


*** Posterior Probabilities and Predicted Level;
label P_SubroFlag1 = 'Predicted: SubroFlag=1' ;
label P_SubroFlag0 = 'Predicted: SubroFlag=0' ;
P_SubroFlag1 = _P0;
_MAXP = _P0;
_IY = 1;
P_SubroFlag0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_SubroFlag = REG2DRF[_IY];
U_SubroFlag = REG2DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
