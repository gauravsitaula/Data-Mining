drop _temp_;
if (P_LBWT1 ge 0.85082872928176) then do;
b_LBWT = 1;
end;
else
if (P_LBWT1 ge 0.73076923076923) then do;
_temp_ = dmran(1234);
b_LBWT = floor(2 + 2*_temp_);
end;
else
if (P_LBWT1 ge 0.56976320582877) then do;
_temp_ = dmran(1234);
b_LBWT = floor(4 + 6*_temp_);
end;
else
if (P_LBWT1 ge 0.54374158815612) then do;
_temp_ = dmran(1234);
b_LBWT = floor(10 + 2*_temp_);
end;
else
if (P_LBWT1 ge 0.39347604485219) then do;
_temp_ = dmran(1234);
b_LBWT = floor(12 + 4*_temp_);
end;
else
do;
_temp_ = dmran(1234);
b_LBWT = floor(16 + 5*_temp_);
end;
