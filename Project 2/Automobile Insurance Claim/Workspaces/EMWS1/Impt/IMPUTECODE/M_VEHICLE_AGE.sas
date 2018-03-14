label M_VEHICLE_AGE = "Imputation Indicator for VEHICLE_AGE";
if missing(VEHICLE_AGE) then M_VEHICLE_AGE = 1;
else M_VEHICLE_AGE= 0;
