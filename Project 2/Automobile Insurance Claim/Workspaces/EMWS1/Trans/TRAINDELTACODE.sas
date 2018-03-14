
if NAME="LOG_HOUSE_VAL" then do;
   COMMENT = "log(HOUSE_VAL  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="HOUSE_VAL" then delete;

if NAME="LOG_INCOME" then do;
   COMMENT = "log(INCOME  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="INCOME" then delete;

if NAME="LOG_VEHICLE_VAL" then do;
   COMMENT = "log(VEHICLE_VAL  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="VEHICLE_VAL" then delete;
