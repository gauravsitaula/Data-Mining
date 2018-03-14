drop _temp_;
if (P_SubroFlag1 ge 0.92811854333896) then do;
b_SubroFlag = 1;
end;
else
if (P_SubroFlag1 ge 0.86634296898371) then do;
b_SubroFlag = 2;
end;
else
if (P_SubroFlag1 ge 0.6609899680381) then do;
b_SubroFlag = 3;
end;
else
if (P_SubroFlag1 ge 0.47841212468665) then do;
b_SubroFlag = 4;
end;
else
if (P_SubroFlag1 ge 0.40548768340457) then do;
_temp_ = dmran(1234);
b_SubroFlag = floor(5 + 2*_temp_);
end;
else
if (P_SubroFlag1 ge 0.37383457737349) then do;
b_SubroFlag = 7;
end;
else
if (P_SubroFlag1 ge 0.36289395229616) then do;
b_SubroFlag = 8;
end;
else
if (P_SubroFlag1 ge 0.34351873547027) then do;
b_SubroFlag = 9;
end;
else
if (P_SubroFlag1 ge 0.30805605344869) then do;
b_SubroFlag = 10;
end;
else
if (P_SubroFlag1 ge 0.28694269403543) then do;
b_SubroFlag = 11;
end;
else
if (P_SubroFlag1 ge 0.24461843106464) then do;
b_SubroFlag = 12;
end;
else
if (P_SubroFlag1 ge 0.23495369315263) then do;
_temp_ = dmran(1234);
b_SubroFlag = floor(13 + 2*_temp_);
end;
else
if (P_SubroFlag1 ge 0.21043696066494) then do;
b_SubroFlag = 15;
end;
else
if (P_SubroFlag1 ge 0.19622183792592) then do;
b_SubroFlag = 16;
end;
else
if (P_SubroFlag1 ge 0.17969736423778) then do;
b_SubroFlag = 17;
end;
else
if (P_SubroFlag1 ge 0.12178824915047) then do;
b_SubroFlag = 18;
end;
else
if (P_SubroFlag1 ge 0.11131562784095) then do;
b_SubroFlag = 19;
end;
else
do;
b_SubroFlag = 20;
end;
