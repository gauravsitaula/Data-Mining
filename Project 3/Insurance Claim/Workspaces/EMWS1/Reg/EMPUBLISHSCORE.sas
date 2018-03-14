*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_SubroFlag $ 12;
label I_SubroFlag = 'Into: SubroFlag' ;
*** Target Values;
array REGDRF [2] $12 _temporary_ ('1' '0' );
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check TextCluster_SVD1 for missing values ;
if missing( TextCluster_SVD1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster_SVD3 for missing values ;
if missing( TextCluster_SVD3 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextTopic_raw3 for missing values ;
if missing( TextTopic_raw3 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextTopic_raw4 for missing values ;
if missing( TextTopic_raw4 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3741721854;
   _P1 = 0.6258278146;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: TextCluster_SVD1 ;
_TEMP = TextCluster_SVD1 ;
_LP0 = _LP0 + (    3.41264423433803 * _TEMP);

***  Effect: TextCluster_SVD3 ;
_TEMP = TextCluster_SVD3 ;
_LP0 = _LP0 + (   -2.78446861745173 * _TEMP);

***  Effect: TextTopic_raw3 ;
_TEMP = TextTopic_raw3 ;
_LP0 = _LP0 + (    4.86085838231928 * _TEMP);

***  Effect: TextTopic_raw4 ;
_TEMP = TextTopic_raw4 ;
_LP0 = _LP0 + (     3.2160144344961 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.61739244071281 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:


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
I_SubroFlag = REGDRF[_IY];
U_SubroFlag = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
