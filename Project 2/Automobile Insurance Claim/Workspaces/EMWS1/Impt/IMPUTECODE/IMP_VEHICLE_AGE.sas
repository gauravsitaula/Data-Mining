format IMP_VEHICLE_AGE 4.0;
label IMP_VEHICLE_AGE = 'Imputed: Age of Vehicle';
IMP_VEHICLE_AGE = VEHICLE_AGE;
if missing(VEHICLE_AGE) then IMP_VEHICLE_AGE = 10.19524179;
