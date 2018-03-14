if NAME = "AGE" then delete;
else 
if NAME    = "IMP_AGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_AGE " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
else 
if NAME  = "M_AREA " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_CAR_USE " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_CHILDREN " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_CHILD_DRIV " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_CLAIM_IND " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_CLM_FREQ " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_DISTANCE " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_EDU_LEVEL " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_GENDER " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
if NAME = "JOB" then delete;
else 
if NAME    = "IMP_JOB"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_JOB " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "LOG_HOUSE_VAL" then delete;
else 
if NAME    = "IMP_LOG_HOUSE_VAL"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_LOG_HOUSE_VAL " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
if NAME = "LOG_INCOME" then delete;
else 
if NAME    = "IMP_LOG_INCOME"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_LOG_INCOME " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
else 
if NAME  = "M_LOG_VEHICLE_VAL " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_MVR_PTS " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_REVOKED " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_STATE_CODE " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
else 
if NAME  = "M_STATUS " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
if NAME = "VEHICLE_AGE" then delete;
else 
if NAME    = "IMP_VEHICLE_AGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_VEHICLE_AGE " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
else 
if NAME  = "M_VEHICLE_TYPE " then do;
   ROLE  ="INPUT";
   LEVEL ="UNARY";
 end;
if NAME = "YOJ" then delete;
else 
if NAME    = "IMP_YOJ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
else 
if NAME  = "M_YOJ " then do;
   ROLE  ="INPUT";
   LEVEL ="BINARY";
 end;
