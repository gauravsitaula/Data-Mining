*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_SubroFlag $ 12;
label I_SubroFlag = 'Into: SubroFlag' ;
*** Target Values;
array REG3DRF [2] $12 _temporary_ ('1' '0' );
label U_SubroFlag = 'Unnormalized Into: SubroFlag' ;
*** Unnormalized target values;
ARRAY REG3DRU[2]  _TEMPORARY_ (1 0);

*** Generate dummy variables for SubroFlag ;
drop _Y ;
label F_SubroFlag = 'From: SubroFlag' ;
length F_SubroFlag $ 12;
F_SubroFlag = put( SubroFlag , BEST12. );
%DMNORMIP( F_SubroFlag )
if missing( SubroFlag ) then do;
   _Y = .;
end;
else do;
   if F_SubroFlag = '0'  then do;
      _Y = 1;
   end;
   else if F_SubroFlag = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check TextCluster4_SVD1 for missing values ;
if missing( TextCluster4_SVD1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster4_SVD10 for missing values ;
if missing( TextCluster4_SVD10 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster4_SVD11 for missing values ;
if missing( TextCluster4_SVD11 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster4_SVD15 for missing values ;
if missing( TextCluster4_SVD15 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextCluster4_SVD21 for missing values ;
if missing( TextCluster4_SVD21 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TextTopic3_raw1 for missing values ;
if missing( TextTopic3_raw1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3741721854;
   _P1 = 0.6258278146;
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: TextCluster4_SVD1 ;
_TEMP = TextCluster4_SVD1 ;
_LP0 = _LP0 + (    10.4952765756598 * _TEMP);

***  Effect: TextCluster4_SVD10 ;
_TEMP = TextCluster4_SVD10 ;
_LP0 = _LP0 + (    5.00785921744755 * _TEMP);

***  Effect: TextCluster4_SVD11 ;
_TEMP = TextCluster4_SVD11 ;
_LP0 = _LP0 + (   -2.81762986141834 * _TEMP);

***  Effect: TextCluster4_SVD15 ;
_TEMP = TextCluster4_SVD15 ;
_LP0 = _LP0 + (   -4.01415881272586 * _TEMP);

***  Effect: TextCluster4_SVD21 ;
_TEMP = TextCluster4_SVD21 ;
_LP0 = _LP0 + (    2.03252202936854 * _TEMP);

***  Effect: TextTopic3_raw1 ;
_TEMP = TextTopic3_raw1 ;
_LP0 = _LP0 + (   -4.19401345630972 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.73626554523115 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG3DR1:

*** Residuals;
if (_Y = .) then do;
   R_SubroFlag1 = .;
   R_SubroFlag0 = .;
end;
else do;
    label R_SubroFlag1 = 'Residual: SubroFlag=1' ;
    label R_SubroFlag0 = 'Residual: SubroFlag=0' ;
   R_SubroFlag1 = - _P0;
   R_SubroFlag0 = - _P1;
   select( _Y );
      when (0)  R_SubroFlag1 = R_SubroFlag1 + 1;
      when (1)  R_SubroFlag0 = R_SubroFlag0 + 1;
   end;
end;

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
I_SubroFlag = REG3DRF[_IY];
U_SubroFlag = REG3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
