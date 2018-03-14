label LOG_VEHICLE_VAL = 'Transformed: Vehicle value';
if VEHICLE_VAL eq . then LOG_VEHICLE_VAL = .;
else do;
if VEHICLE_VAL + 1 > 0 then LOG_VEHICLE_VAL = log(VEHICLE_VAL + 1);
else LOG_VEHICLE_VAL = .;
end;
